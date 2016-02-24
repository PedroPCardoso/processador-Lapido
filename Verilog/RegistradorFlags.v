//Modulo do Registrador de Flags

module RegistradorFlags(r,cond, flagsE, flagsO);


input r; //reseta
input [4:0]cond;
input [3:0] flagsE; //z, c, s, o


output reg [3:0] flagsO; //saida z, c, s, o

always 


if (r)begin 
	 flagsO[0] = 1'b0;
	 flagsO[1] = 1'b0;
	 flagsO[2] = 1'b0; 
	 flagsO[3] = 1'b0;
	
end 

else begin
  
  case (cond)
  
     5'b00000: begin //C = A+B
   
       flagsO[0] = flagsE[0];
	     flagsO[1] = flagsE[1];
	     flagsO[2] = flagsE[2]; 
	     flagsO[3] = flagsE[3];
   
  end
  
  
     5'b00001: begin //C = A+B+1
   
      flagsO[0] = flagsE[0];
	    flagsO[1] = flagsE[1];
	    flagsO[2] = flagsE[2]; 
	    flagsO[3] = flagsE[3];
     end
     
     
      5'b00011: begin // C = A+1
   
      flagsO[0] = flagsE[0];
	    flagsO[1] = flagsE[1];
	    flagsO[2] = flagsE[2]; 
	    flagsO[3] = flagsE[3];
     end
     
      5'b00100: begin //C = A-B-1
   
      flagsO[0] = flagsE[0];
	    flagsO[1] = flagsE[1];
	    flagsO[2] = flagsE[2]; 
	    flagsO[3] = flagsE[3];
     end
     
     5'b00101: begin // C = A- B
   
      flagsO[0] = flagsE[0];
	    flagsO[1] = flagsE[1];
	    flagsO[2] = flagsE[2]; 
	    flagsO[3] = flagsE[3];
     end
     
     
     5'b00110: begin // C = A-1
   
      flagsO[0] = flagsE[0];
	    flagsO[1] = flagsE[1];
	    flagsO[2] = flagsE[2]; 
	    flagsO[3] = flagsE[3];
     end
     
     
     5'b01000: begin // lsl c, a
           //S C Z
      flagsO[0] = flagsE[0];
	    flagsO[1] = flagsE[1];
	    flagsO[2] = flagsE[2]; 
	    
     end
     
      5'b01001: begin // asr c, a
   
      flagsO[0] = flagsE[0];
	    flagsO[1] = flagsE[1];
	    flagsO[2] = flagsE[2]; 
	    flagsO[3] = flagsE[3];
     end
     
     5'b10000: begin // C = 0 
   
      flagsO[0] = flagsE[0];
	   end
     
     
     5'b10001: begin // and c, a, b
   
      flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2]; 
	    
     end
     
      5'b01010: begin //C = !A&B
   
      //S Z
      flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2]; 
	   end 
	   
      5'b01011: begin //C = B
   
      //S Z
      flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2]; 
	    end
	    
	    5'b10100: begin //  C = A&!B
   
      flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2]; 
	    
     end
     
	 
	   
	    5'b10101: begin //C = A  
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	     
	    
	    5'b10110: begin //C = A xor B  
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	    
	   
	    5'b10111: begin //C = A | B  
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	    
	   
	    
	    
	    5'b11000: begin //C = !A&!B 
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	   
	   
	   5'b11000: begin //C = !A&!B 
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	    
	     
	    5'b11001: begin //C = !(A xor B) 
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	   
	   
	    
	    5'b11010: begin //C = !A 
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	   
	   
	    5'b11011: begin //C = !A|B 
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	   
	   
	   5'b11100: begin //C = !B
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	   
	  	    
	    5'b11101: begin //C = A|!B 
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	   end
	    
	    
	    5'b11110: begin //C = !A|!B 
	    
	    flagsO[0] = flagsE[0];
	    flagsO[2] = flagsE[2];
	    
	    end
	    
	    
  endcase


end


endmodule