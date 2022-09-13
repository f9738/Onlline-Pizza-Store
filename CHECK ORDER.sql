set serveroutput on;
set verify off;

ACCEPT XY PROMPT 'PROVIDE THE TOKEN NO.: '  

CREATE OR REPLACE PACKAGE PACK AS

	PROCEDURE PRO(P IN ORDERS.O_ID%TYPE);
	
END PACK;
/

CREATE OR REPLACE PACKAGE BODY PACK AS

	PROCEDURE PRO(P IN ORDERS.O_ID%TYPE) IS
	
	
		CHECKING_ORDER NUMBER := 0;
		CHECKING_ORDER_ID INTEGER;
		
		F1 INTEGER := 0;
		FF VARCHAR(40);
		FFF NUMBER;
		FFFF VARCHAR(25);
		FFFFF VARCHAR(25);
		FFFFFF INTEGER;
		FFFFFFF NUMBER;
		F9 DATE;
		TOTALF NUMBER := 0;
		
		AREA VARCHAR(25);
		
	
	BEGIN
		
		FOR F IN (SELECT * FROM ORDERS WHERE O_ID = P) LOOP
			F1 := F.O_ID;
			/*IF(F1=0) THEN
				FOR F11 IN (SELECT * FROM ORDERS@site1 WHERE O_ID = CHECKING_ORDER_ID) LOOP
					FF := F11.O_ITEMS;
					FFF := F11.QUANTITY;
					FFFF := F11.CUSTOMER_NAME;
					FFFFF := F11.CUSTOMER_ADDRESS;
					FFFFFF := F11.L_ID;
					F9 := F11.THEDATE;
				END LOOP;
			ELSE*/ 
				FF := F.O_ITEMS;
				FFF := F.QUANTITY;
				FFFF := F.CUSTOMER_NAME;
				FFFFF := F.CUSTOMER_ADDRESS;
				FFFFFF := F.L_ID;
				F9 := F.THE_DATE;
			
			--END IF;
			DBMS_OUTPUT.PUT_LINE('ORDER ITEM :' ||FF);
			DBMS_OUTPUT.PUT_LINE('QUANTITY OF ' ||FF ||':'||FFF);
			--DBMS_OUTPUT.PUT_LINE('CUSTOMER NAME' || FFF);
			--DBMS_OUTPUT.PUT_LINE('CUSTOMER ADDRESS' || FFFF);
			--DBMS_OUTPUT.PUT_LINE('CUSTOMER ADDRESS' || FFFF);
			
			
		END LOOP;
		
		DBMS_OUTPUT.PUT_LINE('CUSTOMER NAME :' || FFFF);
		DBMS_OUTPUT.PUT_LINE('CUSTOMER ADDRESS :' || FFFFF);
		DBMS_OUTPUT.PUT_LINE('PURCHASED DATE :' || F9);
		--DBMS_OUTPUT.PUT_LINE('CUSTOMER ADDRESS' || FFFFF);
		
		FOR ZZ IN (SELECT * FROM LOCATION WHERE L_ID = FFFFFF) LOOP
			AREA := ZZ.AREA;
		END LOOP;
		
		DBMS_OUTPUT.PUT_LINE('ORDERED AREA :' || AREA);	
			
		FOR Z IN (SELECT * FROM ORDERS WHERE O_ID = P) LOOP
				FFFFFFF := Z.PRICE;
				TOTALF := TOTALF + FFFFFFF;
		END LOOP;
		
		DBMS_OUTPUT.PUT_LINE('TOTAL PRICE :' || TOTALF);
		
	
	
	END PRO;
	
END PACK;
/

DECLARE

	CHECKING_ORDER NUMBER := 0;
	CHECKING_ORDER_ID INTEGER;
	/*
	F1 INTEGER := 0;
	FF VARCHAR(40);
	FFF NUMBER;
	FFFF VARCHAR(25);
	FFFFF VARCHAR(25);
	FFFFFF INTEGER;
	FFFFFFF NUMBER;
	F9 DATE;
	TOTALF NUMBER := 0;
	
	AREA VARCHAR(25);
*/
BEGIN
	CHECKING_ORDER_ID := &XY;
	
	PACK.PRO(CHECKING_ORDER_ID);



END;
/