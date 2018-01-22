# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
description = '1. Smoke /Sanity Checklist is created/updated to cover with checks all IU modules'\
    ' and basic flows. Checklist is used for:\na) Regression testing.\bUser Acceptance Testing\nc)'\
    ' Sanity Testing.\n\n2. Priorities Definition:\nHigh - cases that cover main flow, '\
    'functionallity that is important and often used.\nLow = cases that cover flows and '\
    'functionallity that is rarely used'
[
  'Android: Basic Acceptance Testing',
  'iOS: Basic Acceptance Testing',
  'Smoke & Critical Path Checklist: Mobiles',
  'Smoke & Critical Path Checklist: Web',
  'Esurance Test Suite'
].each do |title|
  suite = Suite.create(
    title: title,
    description: description
  )
end

suites = Suite.all
suites.each do |suite|
  general = Section.create(title: 'General', suite_id: suite.id)
  setup = general.children.create(title: 'Setup Cards', suite_id: suite.id)
  invite = general.children.create(title: 'Invite', suite_id: suite.id)
  driver = Section.create(title: 'Driver\'s screens', suite_id: suite.id)
  trips = driver.children.create(title: 'Trips', suite_id: suite.id)
  details = trips.children.create(title: 'Trip Details', suite_id: suite.id) #
  score = driver.children.create(title: 'Score', suite_id: suite.id)
  significant = score.children.create(title: 'Significant Trips', suite_id: suite.id)
  trending = score.children.create(title: 'Trip Trending', suite_id: suite.id)
  statistics = score.children.create(title: 'Trip Statistics', suite_id: suite.id)
end
