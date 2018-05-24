Feature: Create Random, Pre-Determined and Auction Circles with ETH and TRST as Organizer.

	@wip1 @day1 @random @eth @random-eth @stage @rc @testnet
	Scenario: create new Random cirlce with etherium currency
		Given User access Metamask
		And User selects "Rinkeby Test Network"
		And User selects new "Random" circle
		And User gives a name to the circle
		And User selects "daily" as contribution frequency
		And User selects "ETH" as contribution "0.005"
		And User should see add participants page
		Then User should accept terms to click create circle
		And User should see circle created
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And participant accepts the circle invite
		Then User sign out as a participant
		And User sign in as an organizer to deploy circles "Rinkeby Test Network"
		And User deploy circle as an organizer to pay for 1st round
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And User pay for 1st round as a participant to the circle


	@wip2 @day1 @random @trst @random-trst @stage @rc @testnet
	Scenario: create new Random cirlce with trst currency
		Given User access Metamask
		And User selects "Rinkeby Test Network"
		And User selects new "Random" circle
		And User gives a name to the circle
		And User selects "daily" as contribution frequency
		And User selects "TRST" as contribution "10"
		And User should see add participants page
		Then User should accept terms to click create circle
		And User should see circle created
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And participant accepts the circle invite
		Then User sign out as a participant
		And User sign in as an organizer to deploy circles "Rinkeby Test Network"
 		And User deploy circle as an organizer to pay for 1st round
		Then User sign out as a organizer
		And User sign in as participant "Rinkeby Test Network"
		And User pay for 1st round as a participant to the circle


	@wip3 @day1 @pre @eth @pre-eth
	Scenario: create new Pre-Determined cirlce with etherium currency
		Given User access Metamask
		And User selects "Rinkeby Test Network"
		And User selects new "Pre-Determined" circle
		And User gives a name to the circle
		And User selects "daily" as contribution frequency
		And User selects "ETH" as contribution "0.005"
		And User should see add participants page
		Then User should accept terms to click create circle
		Then User should see circle created
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And participant accepts the circle invite
		Then User sign out as a participant
		And User sign in as an organizer to deploy circles "Rinkeby Test Network"
		And User deploy circle as an organizer to pay for 1st round
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And User pay for 1st round as a participant to the circle


	@wip4 @day1 @pre @trst @pre-trst
	Scenario: create new Pre-Determined cirlce with trst currency
		Given User access Metamask
		And User selects "Rinkeby Test Network"
		And User selects new "Pre-Determined" circle
		And User gives a name to the circle
		And User selects "daily" as contribution frequency
		And User selects "TRST" as contribution "10"
		And User should see add participants page
		Then User should accept terms to click create circle
		Then User should see circle created
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And participant accepts the circle invite
		Then User sign out as a participant
		And User sign in as an organizer to deploy circles "Rinkeby Test Network"
		And User deploy circle as an organizer to pay for 1st round
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And User pay for 1st round as a participant to the circle

	@wip5 @day1 @auc @eth @auc-eth
	Scenario: create new Auction cirlce with etherium currency
		Given User access Metamask
		And User selects "Rinkeby Test Network"
		And User selects new "Auction" circle
		And User gives a name to the circle
		And User selects "daily" as contribution frequency
		And User selects "ETH" as contribution "0.005"
		And User should see add participants page
		Then User should accept terms to click create circle
		Then User should see circle created
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And participant accepts the circle invite
		Then User sign out as a participant
		And User sign in as an organizer to deploy circles "Rinkeby Test Network"
		And User deploy circle as an organizer to pay for 1st round
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And User pay for 1st round as a participant to the circle


	@wip6 @day1 @auc @trst @auc-trst
	Scenario: create new Auction cirlce with trst currency
		Given User access Metamask
		And User selects "Rinkeby Test Network"
		And User selects new "Auction" circle
		And User gives a name to the circle
		And User selects "daily" as contribution frequency
		And User selects "TRST" as contribution "10"
		And User should see add participants page
		Then User should accept terms to click create circle
		Then User should see circle created
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And participant accepts the circle invite
		Then User sign out as a participant
		And User sign in as an organizer to deploy circles "Rinkeby Test Network"
		And User deploy circle as an organizer to pay for 1st round
		Then User sign out as an organizer
		And User sign in as participant "Rinkeby Test Network"
		And User pay for 1st round as a participant to the circle
