USE basehomework1;
SELECT * FROM mobile_phones;

SELECT product_name, manufacturer, price FROM mobile_phones WHERE product_count > 2;

SELECT product_name, product_count, price FROM mobile_phones WHERE manufacturer = "Samsung";