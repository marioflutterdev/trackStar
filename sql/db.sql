-- Create a table for public profiles
create table profiles (
  id uuid references auth.users on delete cascade not null primary key,
  full_name text,
  email text unique,
  super_user boolean default false,
  description_user text default 'No description',
  avatar_url text
);
-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table profiles
  enable row level security;

create policy "Public profiles are viewable by everyone." on profiles
  for select using (true);

create policy "Users can insert their own profile." on profiles
  for insert with check (auth.uid() = id);

create policy "Users can update own profile." on profiles
  for update using (auth.uid() = id);

-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.

create function public.handle_new_user()
returns trigger as $$
declare
  isSuperUser boolean := false;
begin
  -- Check if the new user is a super user
  if new.raw_user_meta_data->>'super_user' = 'true' then
    isSuperUser := true;
  end if;

  insert into public.profiles (id, email, full_name, avatar_url, super_user, description_user)
  values (new.id, new.email,new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'avatar_url', isSuperUser, new.raw_user_meta_data->>'description_user');
  return new;
end;
$$ language plpgsql security definer;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Set up Storage!
insert into storage.buckets (id, name)
  values ('avatars', 'avatars');

-- Set up access controls for storage.
create policy "Avatar images are publicly accessible." on storage.objects
  for select using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects
  for insert with check (bucket_id = 'avatars');