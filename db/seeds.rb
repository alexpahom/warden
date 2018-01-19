# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
description = '1. Smoke \/Sanity Checklist is created\/updated to cover with checks all IU modules'\
    ' and basic flows. Checklist is used for:\na) Regression testing.\bUser Acceptance Testing\nc)'\
    ' Sanity Testing.\n\n2. Priorities Definition:\nHigh - cases that cover main flow, '\
    'functionallity that is important and often used.\nLow = cases that cover flows and '\
    'functionallity that is rarely used'
[
  'Android: Basic Acceotance Testing',
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
