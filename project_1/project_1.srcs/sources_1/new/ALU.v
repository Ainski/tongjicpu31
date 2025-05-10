`timescale 1ns / 1ps
module alu( 
input [31:0] a,   //32 位输入，操作数1 
input [31:0] b,   //32 位输入，操作数2 
input [3:0] aluc, //4位输入，控制 alu 的操作 
output reg [31:0] r, //32 位输出，由a、b经过aluc指定的操作生成 
output reg zero,        
output reg carry,    
//0 标志位 
  // 进位标志位 
output reg negative,   // 负数标志位 
output reg overflow   // 溢出标志位 
);
  always @ (*) begin 
    case (aluc) 
      4'b0000://无符号加法
      begin
        r = a + b;
        zero = (r == 0);
        carry = (a[31] & b[31]) | (a[31] & ~r[31]) | (b[31] & ~r[31]);
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0010://有符号加法
      begin
        r = $signed(a) + $signed(b);
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = (a[31] & b[31] & ~r[31]) | (~a[31] & ~b[31] & r[31]);
      end
      4'b0001://无符号减法
      begin
        r = a - b;
        zero = (r == 0);
        carry = (~a[31] & b[31]) | (~a[31] & r[31]) | (~b[31] & r[31]);
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0011://有符号减法
      begin
        r = $signed(a) - $signed(b);
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = (~a[31] & b[31] & r[31]) | (a[31] & ~b[31] & ~r[31]);
      end
      4'b0100://与运算
      begin
        r = a & b;
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0101://或运算
      begin
        r = a | b;
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0110://异或运算
      begin
        r = a ^ b;
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0111://nor运算
      begin
        r = ~(a | b);
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1000://Lui运算
      begin
        r={b[15:0],16'b0};
        zero = (r==0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1001://Lui运算
      begin
        r={b[15:0],16'b0};
        zero = (r==0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1011://Slt运算
      begin
        r = ($signed(a) < $signed(b));
        zero = (($signed(a) - $signed(b)) == 0);
        carry = 0;
        negative = ($signed(a) < $signed(b));
        overflow = 0;
      end
      4'b1010://Sltu运算
      begin
        r = (a < b);
        zero = ((a-b) == 0);
        carry = (a<b);
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1100://Sra运算
      begin
        r=($signed(b) >>> $signed(a));
        zero = (r == 0);
        //carry为最后一次被移出的位的数值
        if(a<32&&a>0)
            carry = b[a];
        else if(a==0)
            carry = 0;
        else
            carry=b[31];
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1101://srl
      begin
        r=b>>a;
        zero = (r == 0);
        //carry为最后一次被移出的位的数值
        if(a<32&&a>0)
            carry = b[a];
        else
            carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1110://sll
      begin
        r=b<<a;
        zero = (r == 0);
        //carry为最后一次被移出的位的数值
        if(a<32&&a>0)
            carry=b[32-a];
        else
            carry=0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1111://sla
      begin
        r=b<<a;
        zero = (r == 0);
        //carry为最后一次被移出的位的数值
        carry = b[31];
        negative = (r[31] == 1);
        overflow = 0;
      end
    endcase
    end
endmodule