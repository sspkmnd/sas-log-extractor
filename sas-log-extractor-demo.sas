options ls=64 mprint source2;

%include "~/source2.sas";

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
