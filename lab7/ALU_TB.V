`timescale 1ns/1ps

module dut_tb;
reg [4:0] Operand1, Operand2;
reg [3:0] OPCODE;
wire shift_flag, arith_flag;
wire cmp_flag, logic_flag;
wire [4:0] Result;

reg [4:0] Golden_Result;
integer i, j;

ALU ALU (.Operand1(Operand1), .Operand2(Operand2),
         .OPCODE(OPCODE), .shift_flag(shift_flag),
         .arith_flag(arith_flag), .cmp_flag(cmp_flag),
         .logic_flag(logic_flag), .Result(Result));


// Golden Model Task
task ALU_Golden_Model;
input       [4:0] Operand1, Operand2;
input       [3:0] OPCODE;
output reg  [4:0]  Result;

begin
  case(OPCODE)
  4'b0000: begin
    Result = Operand1 + Operand2;
  end
  4'b0001: begin
    Result = Operand1 - Operand2;
  end
  4'b0010: begin
    Result = Operand1 * Operand2;
  end
  4'b0011: begin
    Result = Operand1 / Operand2;
  end
  4'b0100: begin
    Result = Operand1 & Operand2;
  end
  4'b0101: begin
    Result = Operand1 | Operand2;
  end
  4'b0110: begin
    Result = ~(Operand1 & Operand2);
  end
  4'b0111: begin
    Result = ~(Operand1 | Operand2);
  end
  4'b1000: begin
    Result = Operand1 ^ Operand2;
  end
  4'b1001: begin
    Result = ~(Operand1 ^ Operand2);
  end
  4'b1010: begin
    Result = (Operand1 == Operand2);
  end
  4'b1011: begin
    Result = (Operand1 > Operand2) ? 'd2 : 'd0;
  end
  4'b1100: begin
    Result = (Operand1 < Operand2) ? 'd3 : 'd0;
  end
  4'b1101: begin
    Result = Operand1 >> 1;
  end
  4'b1110: begin
    Result = Operand1 << 1;
  end
  default : Result  = 'd0;
  endcase             
end

endtask

//Checking Task
task Checking_Result;
input  [4:0] Expected_Result;
input  [4:0] Golden_Result;

begin    
if(Golden_Result == Expected_Result)
   $display("Successful check!, Golden Result = Expected Result = %d",
                                Expected_Result);
else 
   $display("False check!, Golden Result = %d, Expected Result = %d",
                                Golden_Result,        Expected_Result);
end

endtask

// Driving Stimulus for All Possible Cases
initial begin

  //Testing possible combination of Adding Operation
  OPCODE = 4'b0000;
    for(i = 0; i < 32; i = i + 1) begin
      for(j = 0; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
        ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
      end
    end

 //Testing all possible combination of Substraction
  OPCODE = 4'b0001;
    for(i = 0; i < 32; i = i + 1) begin
      for(j = 0; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
        ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
      end
    end
  
  //Testing all possible combination of Multiplication'
  OPCODE = 4'b0010;
   for(i = 0; i < 32; i = i + 1) begin
     for(j = 0; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end

   //Testing all possible combinatios of Division (not including Zero)
   OPCODE = 4'b0011;
   for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end
   //Testing all possibilites of Logical AND
   OPCODE = 4'b0100;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end
   
   //Testing all possible combinations of ORING
   OPCODE = 4'b0101;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end

    //Testing all possible combinations of nanding
   OPCODE = 4'b0110;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end

  //Testing all possible combinations of noring
   OPCODE = 4'b0111;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end   

  //Testing all possible combinations of xoring
   OPCODE = 4'b1000;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end 

  //Testing all possible combinations of xnoring
   OPCODE = 4'b1001;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end 

  //Testing all possible combinations of Equality
   OPCODE = 4'b1010;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end 

  //Testing all possible combinations of operand1 > Opernad2
   OPCODE = 4'b1011;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end 

  //Testing all possible combinations of operand1 < Opernad2
   OPCODE = 4'b1100;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end 

    //Testing all possible combinations of shifting rigt 1
   OPCODE = 4'b1101;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end 

    //Testing all possible combinations of shifting left by 1
   OPCODE = 4'b1110;
    for(i = 1; i < 32; i = i + 1) begin
     for(j = 1; j < 32; j = j + 1) begin
        Operand1 = i; Operand2 = j;
       ALU_Golden_Model(Operand1, Operand2, OPCODE, Golden_Result);
        Checking_Result(Result, Golden_Result);
        #5;
     end
   end 
   $stop;
end

endmodule