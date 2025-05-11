`timescale 1ns / 1ps
module alu( 
input [31:0] a,   //32 λ���룬������1 
input [31:0] b,   //32 λ���룬������2 
input [3:0] aluc, //4λ���룬���� alu �Ĳ��� 
output reg [31:0] r, //32 λ�������a��b����alucָ���Ĳ������� 
output reg zero,        
output reg carry,    
//0 ��־λ 
  // ��λ��־λ 
output reg negative,   // ������־λ 
output reg overflow   // �����־λ 
);
  always @ (*) begin 
    case (aluc) 
      4'b0000://�޷��żӷ�
      begin
        r = a + b;
        zero = (r == 0);
        carry = (a[31] & b[31]) | (a[31] & ~r[31]) | (b[31] & ~r[31]);
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0010://�з��żӷ�
      begin
        r = $signed(a) + $signed(b);
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = (a[31] & b[31] & ~r[31]) | (~a[31] & ~b[31] & r[31]);
      end
      4'b0001://�޷��ż���
      begin
        r = a - b;
        zero = (r == 0);
        carry = (~a[31] & b[31]) | (~a[31] & r[31]) | (~b[31] & r[31]);
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0011://�з��ż���
      begin
        r = $signed(a) - $signed(b);
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = (~a[31] & b[31] & r[31]) | (a[31] & ~b[31] & ~r[31]);
      end
      4'b0100://������
      begin
        r = a & b;
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0101://������
      begin
        r = a | b;
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0110://�������
      begin
        r = a ^ b;
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b0111://nor����
      begin
        r = ~(a | b);
        zero = (r == 0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1000://Lui����
      begin
        r={b[15:0],16'b0};
        zero = (r==0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1001://Lui����
      begin
        r={b[15:0],16'b0};
        zero = (r==0);
        carry = 0;
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1011://Slt����
      begin
        r = ($signed(a) < $signed(b));
        zero = (($signed(a) - $signed(b)) == 0);
        carry = 0;
        negative = ($signed(a) < $signed(b));
        overflow = 0;
      end
      4'b1010://Sltu����
      begin
        r = (a < b);
        zero = ((a-b) == 0);
        carry = (a<b);
        negative = (r[31] == 1);
        overflow = 0;
      end
      4'b1100://Sra����
      begin
        r=($signed(b) >>> $signed(a));
        zero = (r == 0);
        //carryΪ���һ�α��Ƴ���λ����ֵ
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
        //carryΪ���һ�α��Ƴ���λ����ֵ
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
        //carryΪ���һ�α��Ƴ���λ����ֵ
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
        //carryΪ���һ�α��Ƴ���λ����ֵ
        carry = b[31];
        negative = (r[31] == 1);
        overflow = 0;
      end
    endcase
    end
endmodule