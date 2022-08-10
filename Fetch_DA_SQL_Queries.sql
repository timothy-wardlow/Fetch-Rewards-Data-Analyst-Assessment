
-- What are the top 5 brands by receipts scanned for most recent month?

SELECT b.name AS top_brands
FROM brands b
JOIN rewardsreceiptitemlist reward ON b.barcode = reward.barcode
JOIN receipts ON receipts.receipt_id = reward.receipt_id
WHERE EXTRACT(MONTH FROM receipts.datescanned) = (select EXTRACT(MONTH FROM receipts.datescanned) ORDER BY EXTRACT(MONTH FROM datescanned) DESC LIMIT 1)
GROUP BY top_brands
ORDER BY count(receipts.receipt_id) DESC
LIMIT 5;

-- When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT rewardsreceiptstatus AS rewards_receipt_status, AVG(totalSpent) AS average_spend_receipts
FROM receipts 
WHERE rewardsreceiptstatus = 'FINISHED' OR rewardsreceiptstatus = 'REJECTED'
GROUP BY reward_receipt_status
ORDER BY average_spend_receipts DESC
LIMIT 2;

--  When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT rewardsreceiptstatus AS reward_receipt_status, SUM(purchasedItemCount) AS num_of_purchased_items
FROM receipts 
WHERE rewardsreceiptstatus = 'FINISHED' OR rewardsreceiptstatus = 'REJECTED'
GROUP BY reward_receipt_status
ORDER BY num_of_purchased_items DESC
LIMIT 2;




