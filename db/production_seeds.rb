admin = User.create(
  name: 'Admin User', 
  email: 'admin@hugs.com', 
  password: 'aaaaaa', 
  password_confirmation: 'aaaaaa', 
  role: 'admin', 
  contact: '09909909091'
)
user1 = User.create(
  name: 'The Philippine Animal Welfare Society • PAWS', 
  email: 'paws@hugs.com', 
  password: 'aaaaaa', 
  password_confirmation: 'aaaaaa', 
  role: 'user', 
  contact: '09909909091'
)
pet1 = Animal.create(
    name: 'Rex',
    species: 'Dog',
    breed: 'Australian Shepherd',
    age: 3,
    description: "Rex is a playful and energetic Australian Shepherd. He's a quick learner and enjoys agility training. He's looking for an active family that can keep up with his enthusiasm.",
    is_adopted: false,
    user_id: 1,
   )
    pet1.image.attach(io: URI.open('https://www.animalhouseshelter.com/wp-content/uploads/2020/06/Oslo-F-GSD-Amstaff-mix-9-weeks-old.jpg'), filename: 'image.jpg')

pet_data = [
  {
    name: 'Whiskers',
    species: 'Cat',
    breed: 'Domestic Shorthair',
    age: 3,
    description: "Whiskers is a charming and curious feline who loves to explore. With her striking green eyes and silky black coat, she's a beauty to behold. Whiskers is looking for a loving home where she can cuddle up with you on the couch.",
    is_adopted: false,
    image: 'https://www.animalhouseshelter.com/wp-content/uploads/2020/06/Oslo-F-GSD-Amstaff-mix-9-weeks-old.jpg'
    user_id: user1.id
  },
  {
    name: 'Mittens',
    species: 'Cat',
    breed: 'Tabby',
    age: 2,
    description: "Mittens is a playful and talkative tabby cat with white paws that look like mittens. He's an expert at finding the sunniest spots to nap in and enjoys chasing feather toys.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Luna',
    species: 'Cat',
    breed: 'Siamese',
    age: 4,
    description: "Luna is a graceful Siamese cat with stunning blue eyes and a gentle personality. She enjoys lounging by the window and would make a wonderful companion for someone who appreciates elegance.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Oliver',
    species: 'Cat',
    breed: 'Ginger',
    age: 5,
    description: "Oliver is a sweet and affectionate ginger cat. His favorite pastime is kneading your lap and purring contently. He's a people-oriented cat who will follow you around the house.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Smokey',
    species: 'Cat',
    breed: 'Black',
    age: 2,
    description: "Smokey is a mysterious and sleek black cat with a calm demeanor. He's an expert at catching toy mice and would be the perfect addition to a quiet, cozy home.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Misty',
    species: 'Cat',
    breed: 'Domestic Longhair',
    age: 4,
    description: "Misty is a gray, long-haired beauty with an independent spirit. She enjoys her alone time but also appreciates a good head scratch from time to time.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Oreo',
    species: 'Cat',
    breed: 'Tuxedo',
    age: 1,
    description: "Oreo is a tuxedo cat with a penchant for mischief. This playful feline loves interactive toys and is always ready for a game of hide and seek.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Bella',
    species: 'Cat',
    breed: 'Calico',
    age: 3,
    description: "Bella is a sweet and petite Calico cat with a gentle disposition. She loves to curl up on your lap and keep you company while you read or watch TV.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Simba',
    species: 'Cat',
    breed: 'Orange Tabby',
    age: 2,
    description: "Simba is a regal orange tabby with a playful side. He's a natural explorer who enjoys climbing cat trees and hunting toy mice.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Loki',
    species: 'Cat',
    breed: 'Tortoiseshell',
    age: 2,
    description: "Loki is an adventurous and mischievous cat with a striking tortoiseshell coat. He's known for his acrobatic antics and will keep you entertained with his playful nature.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Buddy',
    species: 'Dog',
    breed: 'Golden Retriever',
    age: 4,
    description: "Buddy is a lovable and loyal Golden Retriever with a heart of gold. He's great with kids, enjoys long walks, and can't resist a game of fetch in the park.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Coco',
    species: 'Dog',
    breed: 'Chocolate Labrador',
    age: 2,
    description: "Coco is a playful and energetic Chocolate Labrador. She's a bundle of joy who loves to swim and would be a great companion for an active family.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Rocky',
    species: 'Dog',
    breed: 'German Shepherd',
    age: 3,
    description: "Rocky is a strong and protective German Shepherd. He's a great guard dog, but he's also a sweetheart when it comes to his family. He's looking for a home with experienced dog owners.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Daisy',
    species: 'Dog',
    breed: 'Bichon Frise',
    age: 5,
    description: "Daisy is a fluffy and gentle Bichon Frise with a fondness for cuddles. She's a little lap dog who enjoys being pampered and will bring a smile to your face every day.",
    is_adopted: false,
    image: 'https://paws.org.ph/wp-content/uploads/2023/08/DSC_0618-scaled-e1693643745322.jpg'
    user_id: user1.id
  },
  {
    name: 'Max',
    species: 'Dog',
    breed: 'Border Collie',
    age: 2,
    description: "Max is a curious and intelligent Border Collie. He's always up for a game of frisbee and would thrive in a home where he can engage in mental and physical activities.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Luna',
    species: 'Dog',
    breed: 'Greyhound',
    age: 4,
    description: "Luna is an elegant and graceful Greyhound. She's a gentle soul who enjoys leisurely walks and lounging on a comfy bed.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Bentley',
    species: 'Dog',
    breed: 'Beagle',
    age: 3,
    description: "Bentley is a friendly and easygoing Beagle who adores the outdoors. He's an expert sniffer and will happily join you on your daily walks.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Charlie',
    species: 'Dog',
    breed: 'Mixed Breed',
    age: 2,
    description: "Charlie is a mixed breed with a wagging tail that never stops. He's a joyful, medium-sized dog that will make a wonderful addition to an active family.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Molly',
    species: 'Dog',
    breed: 'Shih Tzu',
    age: 6,
    description: "Molly is a Shih Tzu with a beautiful, flowing coat and a gentle nature. She loves to be pampered and will be your loyal companion.",
    is_adopted: false,
    user_id: user1.id
  },
  {
    name: 'Rex',
    species: 'Dog',
    breed: 'Australian Shepherd',
    age: 3,
    description: "Rex is a playful and energetic Australian Shepherd. He's a quick learner and enjoys agility training. He's looking for an active family that can keep up with his enthusiasm.",
    is_adopted: false,
    user_id: user1.id
  }
]

pet_data.each do |pet|
  Animal.create(pet)
end



