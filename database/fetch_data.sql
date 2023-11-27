SELECT bill_id, bill_datetime, total_cost FROM dbo.bill WHERE pay_status = 1;
-- Apply this SELECT statement with the following tables and their fields to fetch data from database:

-- dbo.account (account_id, account_password)

-- dbo.bill (bill_id, bill_datetime, pay_status, res_id, table_id, cus_id, total_cost)

-- dbo.customer (cus_id, cus_name, phone_num, account_id, loyalty_point)

-- dbo.dish (dish_id, dish_name, price, dish_img, dish_type)

-- dbo.dish_isapplied_prom (promotion_id, dish_id)

-- dbo.dish_isincluded_bill (bill_id, dish_id, dish_count, current_price)

-- dbo.prom_applies_bill (promotion_id, bill_id)

-- dbo.promotion (promotion_id, promotion_name, promotion_type, start_time, end_time, reduced_price, reduced_percent)

-- dbo.r_table (res_id, table_id, slot_count)

-- dbo.reser_arrange_table (reservation_id, res_id, table_id)

-- dbo.reser_preorder_dish (reservation_id, dish_id, dish_count)

-- dbo.reservation (reservation_id, quantity, reservation_datetime, cus_id)

-- dbo.restaurant (res_id, res_name, hotline, province, district, ward, address_number, table_count)
