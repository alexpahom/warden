

description = '1. Smoke/Sanity Checklist is created/updated to cover with checks all IU modules'\
    ' and basic flows. Checklist is used for:\na) Regression testing.\bUser Acceptance Testing\nc)'\
    ' Sanity Testing.\n\n2. Priorities Definition:\nHigh - cases that cover main flow, '\
    'functionality that is important and often used.\nLow = cases that cover flows and '\
    'functionality that is rarely used'

test_suites_set = [
  'Android: Basic Acceptance Testing',
  'iOS: Basic Acceptance Testing',
  'Smoke & Critical Path Checklist: Mobiles',
  'Smoke & Critical Path Checklist: Web',
  'Esurance Test Suite'
]

test_cases_set = [
  'Superadmin can log in',
  'Validation message is displayed when user tries to log in with invalid credentials',
  'User can logout',
  'Password expires in 90 days',
  '"Forgot Password" lets user reset his password',
  'User\'s session is closed in 10 minutes of inactivity'
]

test_cases_set2 = [
  'Enter real phone number while inviting driver ',
  'Activation form consists of 3 steps',
  'Validation message is displayed on the 2nd step in case of incorrect data/different passwords'
]

# Creates a set of test suites
test_suites_set.each do |title|
  suite = Suite.create(
    title: title,
    description: description
  )
end

suites = Suite.all

# Creates a tree of sections
suites.each do |suite|
  general = Section.create(title: 'General', suite_id: suite.id)
  setup = general.children.create(title: 'Setup Cards', suite_id: suite.id)
  invite = general.children.create(title: 'Invite', suite_id: suite.id)
  driver = Section.create(title: 'Driver\'s screens', suite_id: suite.id)
  trips = driver.children.create(title: 'Trips', suite_id: suite.id)
  details = trips.children.create(title: 'Trip Details', suite_id: suite.id)
  score = driver.children.create(title: 'Score', suite_id: suite.id)
  significant = score.children.create(title: 'Significant Trips', suite_id: suite.id)
  trending = score.children.create(title: 'Trip Trending', suite_id: suite.id)
  statistics = score.children.create(title: 'Trip Statistics', suite_id: suite.id)

  # Creates test cases for 'general' section
  test_cases_set.each do |test|
    tcase = Case.create(
      section_id: general.id,
      suite_id: general.suite_id,
      title: test,
      template: 'checklist'
    )
  end

  # Creates test cases for 'invite' section
  test_cases_set2.each do |test|
    tcase = Case.create(
      section_id: invite.id,
      suite_id: invite.suite_id,
      title: test,
      template: 'checklist'
    )
  end
end

Case.all.each do |tcase|
  Step.create(
    action: 'First step is to make a cup of coffee',
    case_id: tcase.id
  )
  ExpResult.create(
    action: 'Coffee is done!',
    case_id: tcase.id
  )
end

