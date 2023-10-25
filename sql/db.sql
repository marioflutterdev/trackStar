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

alter table profiles
  enable row level security;

create policy "Public profiles are viewable by everyone." on profiles
  for select using (true);

create policy "Users can insert their own profile." on profiles
  for insert with check (auth.uid() = id);

create policy "Users can update own profile." on profiles
  for update using (auth.uid() = id);


create function public.handle_new_user()
returns trigger as $$
declare
  isSuperUser boolean := false;
begin
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

insert into storage.buckets (id, name)
  values ('avatars', 'avatars');

create policy "Avatar images are publicly accessible." on storage.objects
  for select using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects
  for insert with check (bucket_id = 'avatars');

-- Create a table for public Products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name_product TEXT NOT NULL,
  description_product TEXT,
  avatar_url TEXT
);
-- Create a table for public Products
CREATE TABLE center_distribution (
  id SERIAL PRIMARY KEY,
  name_center TEXT NOT NULL,
  address TEXT NOT NULL,
  user_id INTEGER NOT NULL REFERENCES profiles(id)
);

CREATE TABLE center_distribution_products (
  id SERIAL PRIMARY KEY,
  center_distribution_id INTEGER NOT NULL REFERENCES center_distribution(id),
  product_id INTEGER NOT NULL REFERENCES products(id)
);

-- Insertar datos ficticios en la tabla products
INSERT INTO products (name_products, description_products, avatar_url)
VALUES ('Producto 1', 'Descripción del producto 1', 'https://example.com/producto1.jpg'),
     ('Producto 2', 'Descripción del producto 2', 'https://example.com/producto2.jpg'),
     ('Producto 3', 'Descripción del producto 3', 'https://example.com/producto3.jpg');

-- Insertar datos ficticios en la tabla center_distribution
INSERT INTO center_distribution (name_center, address, user_id)
VALUES ('Centro de distribución 1', 'Dirección del centro de distribución 1', 1),
     ('Centro de distribución 2', 'Dirección del centro de distribución 2', 2),
     ('Centro de distribución 3', 'Dirección del centro de distribución 3', 3);

-- Insertar datos ficticios en la tabla center_distribution_products
INSERT INTO center_distribution_products (center_distribution_id, product_id)
VALUES (1, 1),
     (1, 2),
     (2, 2),
     (3, 1),
     (3, 3);