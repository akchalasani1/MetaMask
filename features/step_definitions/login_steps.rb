
Given(/^User access Metamask$/) do
  @app.login.access_metamask
end


And(/^User selects "([^"]*)"$/) do |network_name|
  @app.login.select_network(network_name, $org_wallet_phase, $org_wallet_password, $org_wallet_cnfm_password, $org_wallet_key)
end


And(/^User selects "([^"]*)" as participant$/) do |network_name|
  @app.login.ptcpnt_select_network(network_name, $prpnt_wallet_phase, $prpnt_wallet_password, $prpnt_wallet_cnfm_password, $prpnt_wallet_key)

end
