
And(/^User gives a name to the circle$/) do
  @app.createcircle.enter_crcl_name
end

And(/^User selects new "([^"]*)" circle$/) do |circle_type|
  @app.createcircle.select_circle_type(circle_type)
end

And(/^User selects "([^"]*)" as contribution frequency$/) do |frqncy_type|
  @app.createcircle.select_cntrbn_frq(frqncy_type)
end

And(/^User selects "([^"]*)" as contribution "([^"]*)"$/) do |crncy_type, amount|
  @app.createcircle.contribution_amount(crncy_type, amount)
end


And(/^User should see add participants page$/) do
  @app.createcircle.add_participant
end


Then(/^User should accept terms to click create circle$/) do
  @app.createcircle.term_condi
end

And(/^User should see circle created$/) do
  #expect(@app.createcircle.crcl_crtd.text).to eq("Your circle was created")
end


Then(/^User sign out as an organizer$/) do
  @app.login.access_metamask
  @app.createcircle.user_signout
end


And(/^User sign in as participant "([^"]*)"$/) do |network_name|
  @app.login.user_select_network(network_name, $prpnt_wallet_phase, $prpnt_wallet_password, $prpnt_wallet_cnfm_password, $prpnt_wallet_key)
end


And(/^participant accepts the circle invite$/) do
  @app.createcircle.accept_circle
end


Then(/^User sign out as a participant$/) do
  @app.login.access_metamask
  @app.createcircle.user_signout
end


And(/^User sign in as an organizer to deploy circles "([^"]*)"$/) do |network_name|
  @app.login.user_select_network(network_name, $org_wallet_phase, $org_wallet_password, $org_wallet_cnfm_password, $org_wallet_key)
end


And(/^User deploy circle as an organizer to pay for 1st round$/) do
  @app.createcircle.dply_circle
  @app.createcircle.review_crcl
  @app.createcircle.pay_crcl
end

Then(/^User sign out as a organizer$/) do
  @app.createcircle.user_signout
end

And(/^User pay for 1st round as a participant to the circle$/) do
  @app.createcircle.pay_crcl
end


