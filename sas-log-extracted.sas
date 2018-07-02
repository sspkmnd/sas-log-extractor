OPTIONS NONOTES NOSTIMER NOSOURCE NOSYNTAXCHECK;
options ls=64 mprint source2;
%include "~/source2.sas";
data _null_;
set sashelp.class;
if Name = 'John' then do;
put "Lorem Ipsum is simply dummy text of the
printing and typesetting
industry. Lorem Ipsum has been the industry's
standard dummy text ever
since the 1500s, when an unknown printer took a
galley of type and scrambled
it to make a type specimen book. It has survived not
only five centuries, but
also the leap into electronic typesetting, remaining
essentially unchanged.
It was popularised in the 1960s with the release of
Letraset sheets containing
Lorem Ipsum passages, and more recently with desktop
publishing software like
Aldus PageMaker including versions of Lorem Ipsum.";
end;
run;
proc print data=sashelp.cars;
run;
%macro useless_loop(times);
data class&times;
set %do i=1 %to &times;
                sashelp.class
            %end;
        ;
    run;
%mend;
%useless_loop(50)
   data class50;
   set sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class 
sashelp.class sashelp.class sashelp.class sashelp.class ;
   run;
OPTIONS NONOTES NOSTIMER NOSOURCE NOSYNTAXCHECK;
