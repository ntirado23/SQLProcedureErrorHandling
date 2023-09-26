USE om;
DROP PROCEDURE IF EXISTS new_item;
DELIMITER //

CREATE PROCEDURE new_item(
	new_item_id INT,
	new_title VARCHAR(50),
	new_artist VARCHAR(50),
	new_price DECIMAL(9,2)
)

BEGIN
	
    DECLARE duplicate_key TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR 1062
		SET duplicate_key = TRUE;
    
	INSERT INTO items
    VALUES (new_item_id, new_title, new_artist, new_price);
    
    IF duplicate_key = TRUE THEN
		SELECT 'Item could not be added due to duplicate key.'  as 'Message';
	ELSE
		SELECT 'New item has been added successfully' as 'Message';
	END IF;
	
END //

DELIMITER ;