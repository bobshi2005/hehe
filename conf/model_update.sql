use hehe;

ALTER TABLE  project_project MODIFY COLUMN payment_type LONGTEXT;


--ALTER TABLE `project_project`  ADD COLUMN `short_name` varchar(50);

ALTER TABLE `order_orderline` 
ADD COLUMN `brand_id` int(11) DEFAULT NULL, 
ADD CONSTRAINT `FK_material_brand_id` FOREIGN KEY (`brand_id`) 
REFERENCES `material_brand`(`id`);

--New
ALTER TABLE `document_document`  ADD COLUMN `project_id` integer;
ALTER TABLE `document_document` ADD CONSTRAINT `project_id_refs_id_a256ae76` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`);

ALTER TABLE `document_documentlineitem`  ADD COLUMN `approval_comments` LONGTEXT;

ALTER TABLE `material_vendor`  ADD COLUMN `parent_id` integer;
ALTER TABLE `material_vendor`  ADD COLUMN `lft` integer UNSIGNED NOT NULL;
ALTER TABLE `material_vendor`  ADD COLUMN `rght` integer UNSIGNED NOT NULL;
ALTER TABLE `material_vendor`  ADD COLUMN `tree_id` integer UNSIGNED NOT NULL;
ALTER TABLE `material_vendor`  ADD COLUMN `level` integer UNSIGNED NOT NULL;

ALTER TABLE `material_vendor` ADD CONSTRAINT `parent_id_refs_id_fd4d7a4c` FOREIGN KEY (`parent_id`) REFERENCES `material_vendor` (`id`);

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;

update material_vendor set tree_id = id -1, lft = 1, rght = 2;

UPDATE document_document d
INNER JOIN (
	        select distinct a.document_id, b.project_id  from document_documentlineitem a, project_projectmaterial b where a.projectMaterial_id = b.id  
		   ) t  ON d.id = t.document_id
SET d.project_id = t.project_id

ALTER TABLE `project_project`  ADD COLUMN `full_name` varchar(50);

--New

use hehe;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `document_document`  ADD COLUMN `purch_status` varchar(20);

DELIMITER //  

CREATE PROCEDURE update_purch_status()
BEGIN
  
  DECLARE v_doc_id varchar(100);
  DECLARE v_doc_line_id int;
  DECLARE v_total_purch_qty int;
  DECLARE v_expected_quantity int;
  DECLARE v_audit_quantity int;
  DECLARE v_quantity int;
  DECLARE v_count int;
  DECLARE v_line_count int;
  DECLARE v_status varchar(100);
  DECLARE done int;

  DECLARE cursor_doc CURSOR FOR SELECT id FROM document_document where document_type = 0;
  DECLARE curson_doc_line CURSOR FOR SELECT id, expected_quantity, audit_quantity FROM document_documentlineitem
  WHERE document_id = v_doc_id;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  

  OPEN cursor_doc;
out_loop:
LOOP
  FETCH cursor_doc INTO v_doc_id;
  IF done = 1 THEN
    LEAVE out_loop;
  END IF;
  
  set v_status = '未采购';
  SET v_count = 0;
  set v_line_count  = 0;

  open curson_doc_line;
  inner_loop:LOOP
     
    FETCH curson_doc_line INTO v_doc_line_id, v_expected_quantity, v_audit_quantity; 
    IF done = 1 THEN
       LEAVE inner_loop;
     end IF;
     

	 set v_line_count  = v_line_count + 1;

	 SELECT SUM(purchase_quantity) FROM order_orderline WHERE documentLineItem_id = v_doc_line_id into v_total_purch_qty;		

	 if v_total_purch_qty > 0 then
		
		
		if v_expected_quantity > 0 then 
           SET v_quantity = v_expected_quantity;
         end if;

        if v_audit_quantity > 0 then 
           SET v_quantity = v_audit_quantity;
         end if;
		
		
		if v_quantity = v_total_purch_qty then
			SET v_count = v_count +1;
		end if;
		
        if v_total_purch_qty < v_quantity then
			set v_status = '采购中';
		end if;

     end if;
	
  end LOOP inner_loop;
  CLOSE curson_doc_line; 
	 
  /** SET @output_string = concat('count:', v_count, ',line_count:', v_line_count, ',document:', v_doc_id, ',document_line:', v_doc_line_id);
  SELECT @output_string;
  **/

  if v_count = v_line_count then
     set v_status = '采购完成';
   end if;
  
  if v_count > 0 and v_count < v_line_count then
     set v_status = '采购中';
   end if;
   

  update document_document set purch_status = v_status where id = v_doc_id;
  SET done=0;
END LOOP out_loop;
  CLOSE cursor_doc;
END//



ALTER TABLE  workflow_item MODIFY COLUMN status smallint(6) NULL;


--New
ALTER TABLE `project_project`  ADD COLUMN `settlement_amount` decimal(15,2);
ALTER TABLE `project_project`  ADD COLUMN `file` varchar(100);
ALTER TABLE `document_documentlineitem`  ADD COLUMN `material_id`  int(11);


ALTER TABLE `project_projectmaterial`  ADD COLUMN `category_id` int(11);


ALTER TABLE  material_specification MODIFY COLUMN name varchar(250) ;


ALTER TABLE `material_material`  ADD COLUMN `specification` varchar(250);

DELIMITER //
CREATE PROCEDURE update_specification()
BEGIN

DECLARE v_specification_id int;
DECLARE v_finished INTEGER DEFAULT 0;
DECLARE v_name varchar(250);

DECLARE material_curs CURSOR FOR SELECT id, name FROM material_specification;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
OPEN  material_curs;

get_specification: LOOP
 FETCH material_curs INTO v_specification_id, v_name;
 IF v_finished = 1 THEN 
 LEAVE get_specification;
 END IF;
 
update material_material set specification = v_name where specification_id = v_specification_id;

END LOOP get_specification;

CLOSE material_curs;

END//


ALTER TABLE `document_documentlineitem`  ADD COLUMN `material` varchar(250);


ALTER TABLE  workflow_taskhistory MODIFY COLUMN create_date datetime ;
ALTER TABLE `order_receivingline`  ADD COLUMN `comments` LONGTEXT;
ALTER TABLE `project_project`  ADD COLUMN `material_amount` decimal(15,2);
ALTER TABLE `project_project`  ADD COLUMN `one_month_amount` decimal(15,2);
ALTER TABLE `project_project`  ADD COLUMN `two_month_amount` decimal(15,2);
ALTER TABLE setting_projectsetting CHANGE before_2014_amount before_2015_amount decimal(15,2); 
ALTER TABLE setting_vendorsetting CHANGE before_2013_owed_amount before_2014_owed_amount decimal(15,2); 
ALTER TABLE setting_vendorsetting CHANGE before_2013_owed_invoice before_2014_owed_invoice decimal(15,2); 
ALTER TABLE `setting_vendorsetting`  ADD COLUMN `before_2015_2_owed_amount` decimal(15,2);
ALTER TABLE `setting_vendorsetting`  ADD COLUMN `before_2015_2_owed_invoice` decimal(15,2);
ALTER TABLE `setting_vendorsetting`  ADD COLUMN `before_2015_2_received_amount` decimal(15,2);


update order_order set vendor_id = 149 where vendor_id = 173;
update order_checkaccount set vendor_id = 149 where vendor_id = 173;
update order_invoice set vendor_id = 149 where vendor_id = 173;
update payment_payment set vendor_id = 149 where vendor_id = 173;
update order_invoice set vendor_id = 149 where vendor_id = 173;
update setting_vendorsetting set vendor_id = 149 where vendor_id = 173;
delete from material_vendor where id = 173;

--to do update
ALTER TABLE order_receivingline MODIFY COLUMN receiving_quantity  decimal(15,2); 
ALTER TABLE order_receivingline MODIFY COLUMN original_receiving_quantity  decimal(15,2);



DELIMITER //
CREATE PROCEDURE remove_duplicate_material()
BEGIN

DECLARE v_id int;
DECLARE v_name varchar(250);
DECLARE v_category_id INTEGER DEFAULT 0;
DECLARE v_specification varchar(250);
DECLARE v_unit_id INTEGER DEFAULT 0;
DECLARE v_finished INTEGER DEFAULT 0;




DECLARE first_id int;
DECLARE first_name varchar(250);
DECLARE first_category_id INTEGER DEFAULT 0;
DECLARE first_specification varchar(250);
DECLARE first_unit_id INTEGER DEFAULT 0;
DECLARE output_string longtext;


DECLARE first_material_curs CURSOR FOR 
 SELECT distinct m1.name, m1.category_id, m1.unit_id, m1.specification   
 FROM material_material   m1, material_material   m2   
 WHERE m1.id<>m2.id   
 AND m1.name   =   m2.name   
 AND m1.category_id   =   m2.category_id   
 AND m1.specification   =   m2.specification
 AND m1.unit_id   =   m2.unit_id
 order by name, specification, unit_id;
 
 
DECLARE material_curs CURSOR FOR 
SELECT m1.id, m1.name, m1.category_id, m1.specification, m1.unit_id     
 FROM material_material   m1, material_material   m2   
 WHERE m1.id<>m2.id   
 AND m1.name   =   m2.name   
 AND m1.category_id   =   m2.category_id   
 AND m1.specification   =   m2.specification
 AND m1.unit_id   =   m2.unit_id
 order by name, specification, unit_id;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;


OPEN  first_material_curs;

get_first_material: LOOP
 
 FETCH first_material_curs INTO first_name, first_category_id, first_unit_id, first_specification;
 IF v_finished = 1 THEN 
 LEAVE get_first_material;
 END IF;

 set first_id = -99999;
 
 
OPEN  material_curs;

get_material: LOOP
 
 FETCH material_curs INTO v_id, v_name, v_category_id, v_specification, v_unit_id;
 IF v_finished = 1 THEN 
 LEAVE get_material;
 END IF;
 
 if first_id = -99999 and first_name = v_name and first_category_id = v_category_id and first_unit_id = v_unit_id and first_specification = v_specification then
  set first_id = v_id; 
 end if;
 
 if first_id <> v_id and first_name = v_name and first_category_id = v_category_id and first_unit_id = v_unit_id and first_specification = v_specification then
  update project_projectmaterial set material_id = first_id where material_id = v_id;
  delete from material_material where id = v_id;
  SET output_string =  concat_ws(', ', output_string, v_id);
  
 end if;
 


END LOOP get_material;

CLOSE material_curs;

SET v_finished=0;
END LOOP get_first_material;

CLOSE first_material_curs;
SELECT output_string;
END//

ALTER TABLE `order_order`  ADD COLUMN `user_id` int(11);


ALTER TABLE `order_invoice`  ADD COLUMN `receive_date` tinyint(1);


ALTER TABLE  order_invoice MODIFY COLUMN receive_date date NULL;

ALTER TABLE `material_vendor`  ADD COLUMN `short_name` varchar(50) DEFAULT NULL;

-- to do update
ALTER TABLE `payment_payment`  ADD COLUMN `bank` varchar(50) DEFAULT NULL;
ALTER TABLE `payment_payment`  ADD COLUMN `account` varchar(50) DEFAULT NULL;
ALTER TABLE  document_documentlineitem MODIFY COLUMN expected_quantity decimal(15,2) ;
ALTER TABLE  document_documentlineitem MODIFY COLUMN posted_quantity decimal(15,2) ;
ALTER TABLE  document_documentlineitem MODIFY COLUMN audit_quantity decimal(15,2) ;
ALTER TABLE  order_orderline MODIFY COLUMN purchase_quantity decimal(15,2) ;

