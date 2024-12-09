module mux_entradas(input ch0,ch1,ch2,ch3,output A1,A0);

 //ch1 andar 1...

 
	
 assign A0=(~ch0&~ch1&~ch2&ch3)||(~ch0&ch1&~ch2&~ch3);
 assign A1=(~ch0&~ch1&ch2);
 

 
 endmodule 