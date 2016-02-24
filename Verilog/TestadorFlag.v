// z = zero
// c = carry
// s = sinal
// o = oveflow
module TestadorFlag( cond, Flags, sinalJump, out ); 

input  sinalJump; 
input [3:0] Flags;        //z, c, s, o
input [2:0] cond;         //condi��o a ser testada
output reg out;

always 

case (cond)
  3'b001: begin  //condi��o neg
    if(sinalJump)begin   //se jump true
      if(Flags[2])
        out = 1'b1;
        
        //faz jump
      else 
        //n�o faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[2])
        //n�o faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end
  
  
  
  3'b010: begin  //condi��o zero
    if(sinalJump)begin   //se jump true
      if(Flags[0])
        out = 1'b1;
        
        //faz jump
      else 
        //n�o faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[0])
        //n�o faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end
  
  
  3'b100: begin  //condi��o carry
    if(sinalJump)begin   //se jump true
      if(Flags[1])
        out = 1'b1;
        
        //faz jump
      else 
        //n�o faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[1])
        //n�o faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end
  
 
  
  
3'b101: begin  //condi��o negzerro
    if(sinalJump)begin   //se jump true
      if(Flags[2] || Flags[0])
        out = 1'b1;
        
        //faz jump
      else 
        //n�o faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[2]  || Flags[0])
        //n�o faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end

3'b001: begin  //condi��o True
    if(sinalJump)begin   //se jump true
      
        out = 1'b0;
        
        //faz jump
    end
      else 
       
        out = 1'b1;
    end
    
    
3'b101: begin  //condi��o overflow
    if(sinalJump)begin   //se jump true
      if(Flags[3])
        out = 1'b1;
        
        //faz jump
      else 
        //n�o faz jump
        out = 1'b0;
    end
    else begin
      if(Flags[3])
        //n�o faz jump
        out = 1'b0;
      else 
        //faz jump
        out = 1'b1;
    end
  end




endcase 
 
 endmodule 

