# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
UniqueUrl.delete_all
permutations = ("a".."z").to_a + (0..9).to_a
permutations = permutations.permutation(3).to_a 
permutations.shuffle!
strings = []
permutations.each do |perm|
  string = ""
  perm.each do |letter|
    string += letter.to_s
  end
  puts string
  strings.push string
end
i = 1
strings.each do |perm|
  UniqueUrl.create({url: perm})
  puts "Done creating record (#{i}/#{permutations.size}) #{perm} "
  i += 1
end
