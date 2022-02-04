create or replace PACKAGE GEOMETRIE
as
    type rechteck_daten is RECORD(a number, b number);
    KLEINER_NULL EXCEPTION;
    KLEINER_NULL_ERROR_CODE pls_INTEGER := -20932; -- hat nur die aufgabe den fehler code innerhalt des packages bekannt zumachen 
    PRAGMA EXCEPTION_INIT(KLEINER_NULL, -20932);
    MY_PI number := 3.14;
    FUNCTION area(a number, b number)return number;
    FUNCTION kreis(r number ) return number;
    -- neu
    procedure p_area(a number, b number, o out number);
    function add5(num number) return number;
END;
/


create or replace PACKAGE BODY GEOMETRIE
as 
    function add5(num number) return number
    as 
    begin
        return num +5 ;
    end;

   FUNCTION area(a number, b number)return number
   as
   BEGIN
    if a < 0 or b < 0 then
        raise KLEINER_NULL;
    end if;
    RETURN a * b;
   END;
   
   function kreis(r number) return number
   as 
   BEGIN
    if r < 0 then 
        raise KLEINER_NULL;
    END IF;
    RETURN r * r * my_pi;
   END;
   
   procedure p_area(a in number, b in number, o out number)
   as
   begin
        o := area(a,b);
   end;
END;
/
