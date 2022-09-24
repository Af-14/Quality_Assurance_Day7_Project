# robot_framework_test

----Task 1

Switch to virtual account (estimation time: 1 hour)

1. Log in using your account

2. Check the current account lands on real account

3. Then switch to virtual account and verify virtual account is displayed


----Task 2

Buy rise contract (estimation time: 1 hour)

- Underlying: Volatility 10 (1s) Index
- Contract type: Rise
- Duration: 5 ticks
- Stake: 10.00 USD


----Task 3

Buy lower contract (estimation time: 30 min)

- Underlying: AUD/USD
- Contract type: Lower
- Duration: 2 days

- Barrier: Default
- Payout: 15.50 USD

Key points:

- Create keywords to reuse the functionalities of selecting underlying and contract type

- Use payout instead of stake


----Task 4

Check relative barrier error (estimation time: 30 min)

- Underlying: AUD/USD
- Contract type: Lower
- Duration: 2 days

- Barrier: (use a barrier that could generate the error)
- Payout: 10 USD

Key points:

- Make sure this error message appears: Contracts more than 24 hours in duration would need an
absolute barrier

- Make sure the Lower button is disabled


----Task 5

Check multiplier contract parameter (estimation time: 2 hours)

- Underlying: Volatility 50 Index

- Contract type: Multiplier

Key points:

a. Only stake is allowed. Should not have payout option

b. Only deal cancellation or take profit/stop loss is allowed

c. Multiplier value selection should have x20, x40, x60, x100, x200

d. Deal cancellation fee should correlate with the stake value (e.g. deal cancellation fee is more
expensive when the stake is higher)

e. Maximum stake is 2000 USD

f. Minimum stake is 1 USD

g. Single click on plus (+) button of take profit field should increase the take profit value by 1 USD

h. Single click on minus (-) button of take profit field should decrease the take profit value by 1
USD

i. Deal cancellation duration only has these options: 5, 10, 15, 30 and 60 min
