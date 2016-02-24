// z = zero
// c = carry
// s = sinal
// o = oveflow
module TestadorFlag( cond, Flags, sinalJump, out ); 

input  sinalJump; 
input [3:0] Flags;        //z, c, s, o
input [2:0] cond;         //condição a ser testada
output reg out;

always 

case (cond)
  3'b001: begin  //condição neg
    if(sinalJump)begin   //se jump true
      if(Flags[2])
        out = 1'b1;
        
        //faz jump
      else 
        //não faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[2])
        //não faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end
  
  
  
  3'b010: begin  //condição zero
    if(sinalJump)begin   //se jump true
      if(Flags[0])
        out = 1'b1;
        
        //faz jump
      else 
        //não faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[0])
        //não faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end
  
  
  3'b100: begin  //condição carry
    if(sinalJump)begin   //se jump true
      if(Flags[1])
        out = 1'b1;
        
        //faz jump
      else 
        //não faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[1])
        //não faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end
  
 
  
  
3'b101: begin  //condição negzerro
    if(sinalJump)begin   //se jump true
      if(Flags[2] || Flags[0])
        out = 1'b1;
        
        //faz jump
      else 
        //não faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[2]  || Flags[0])
        //não faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end

3'b001: begin  //condição True
    if(sinalJump)begin   //se jump true
      
        out = 1'b0;
        
        //faz jump
    end
      else 
       
        out = 1'b1;
    end
    
    
3'b101: begin  //condição overflow
    if(sinalJump)begin   //se jump true
      if(Flags[3])
        out = 1'b1;
        
        //faz jump
      else 
        //não faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[3])
        //não faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end




endcase 
 
 endmodule 

