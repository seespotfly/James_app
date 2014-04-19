# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

{
    'Desk' => 1,
    'Office' => 5,
    'Suite' => 18,
    'Partner' => 22,
    'Owner' => 100
}.each do |type, count|
  Relationship.create(name: type, text_count: count)
end if Relationship.count == 0

if Organization.count == 0
  owner = Relationship.find_by_name("Owner")
  Organization.create(name: "Packard Place", relationship_id: owner.id)
end

Setting.create(code_scheme: 0) if Setting.count == 0
