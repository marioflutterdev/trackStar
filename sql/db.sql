-- Create a table for public profiles
create table profiles (
  id uuid references auth.users on delete cascade not null primary key,
  email text unique,
  first_name text,
  last_name text,
  address_profile text,
  document_profile text unique,
  phone_number text unique,
  avatar_url text,
  super_user boolean default false
);

-- Set up Row Level Security (RLS)

alter table profiles
  enable row level security;

create policy "Public profiles are viewable by everyone." on profiles
  for select using (true);

create policy "Users can insert their own profile." on profiles
  for insert with check (auth.uid() = id);

create policy "Users can update own profile." on profiles
  for update using (auth.uid() = id);

create policy "Only superusers can delete profiles." on profiles
  for delete using (super_user = true);

create function public.handle_new_user()
returns trigger as $$
declare
  isSuperUser boolean := false;
begin
  if new.raw_user_meta_data->>'super_user' = 'true' then
    isSuperUser := true;
  end if;

  insert into public.profiles (id, email, first_name, last_name, address_profile, document_profile, phone_number, avatar_url, super_user)
  values (
  new.id, 
  new.email,new.raw_user_meta_data->>'first_name', 
  new.raw_user_meta_data->>'last_name',
  new.raw_user_meta_data->>'address_profile',  
  new.raw_user_meta_data->>'document_profile',  
  new.raw_user_meta_data->>'phone_number',  
  new.raw_user_meta_data->>'avatar_url',
  isSuperUser);
  return new;
end;
$$ language plpgsql security definer;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

insert into storage.buckets (id, name)
  values ('avatars', 'avatars');

create policy "Avatar images are publicly accessible." on storage.objects
  for select using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects
  for insert with check (bucket_id = 'avatars');

-- Create a table for public Products

create table products (
    id uuid not null primary key,
    code_prodrocts serial not null unique,
    name_product text not null unique,
    description_product text null,
    avatar_url text null unique
);

-- Create a table for public Center Distribution 

create table center (
    id uuid not null primary key,
    name_center text not null unique,
    address_center text not null unique,
    description_center text null,
    avatar_url text null
);

-- Create a table for inventory of center distribution

create table inventory (
    id uuid not null primary key ,
    id_center uuid not null references center(id) on delete cascade,
    id_product uuid not null references products(id) on delete cascade,
    quantity int not null,
    price int not null
);
