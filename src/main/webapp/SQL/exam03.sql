set serveroutput on
declare
   /*  테이블 타입 정의 : 배열로 선언되어 져서 인덱스 주소번호로 접근하여 값을 가져옴*/
   
   type ename_table_type is table of emp27.ename%type index by binary_integer;
   type LOC_table_type is table of emp27.LOC%type index by binary_integer;
   
   --테이블 타입 변수 선언
   ename_type ename_table_type;
   LOC_type LOC_table_type;
   
   --테이블 타입은 배열로 부터 데이터를 가져오기 위한 인덱스 주소번호로 사용하기 위한 변수선언과 초기화
   i binary_integer := 0;
   
begin
    for k in (select ename,LOC from emp27) LOOP  --emp27테이블로 부터 사원이름과 사는지역을 가져와서 테이블 타입 배열변수
    --에 저장
    i := i+1;  --1씩 증가 즉 인덱스 주소번호 증가
    ename_type(i) :=  k.ename; --사원명 저장
    LOC_type(i) :=  k.LOC; --사는 지역 저장    
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('사원명'  ||   '  /  ' ||  '사는 지역');
    dbms_output.put_line('========================');
    
    FOR j in 1..i loop
      dbms_output.put_line(ename_type(j) ||'   /  '||  LOC_type(j));
    end loop;
end;
/



