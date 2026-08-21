module tb;
logic clk;
logic rst;
logic signed [7:0] x;
logic signed [7:0] h [0:3];
logic signed [18:0] y;

//instantiation
FIR dut(clk,rst,x,h,y);

//generation of clk wrt time
always #5 clk=~clk;

//put in values
initial
begin

clk=0;
rst=1;
x=0;
#10;

h[0]=1;
h[1]=2;
h[2]=3;
h[3]=4;

//now change rst to input values into value[i]
#10;
rst=0;

x=0; #10;
x=1; #10;
x=2; #10;
x=3; #10;
x=4; #10;
x=5; #10;
x=6; #10;
x=7; #10;
x=8; #10;
x=9; #10;
x=10; #10;

$finish;
end

initial begin
$monitor("time=%0t rst=%b x=%d y=%d",$time,rst,x,y);
end

endmodule