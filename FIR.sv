module FIR(
input clk,
input rst,
input logic signed [7:0] x, //logic is a system datatype to say that x can hold digital value
input logic signed [7:0] h [0:3], //here h have 4 numbers with 8 bits each 
output logic signed [18:0] y);
//y can have 19 bits at max as y=hi*(xi+xi-7) till 4 terms so the single term can give 17 bits
//the further sum gives max 19 bits

logic signed [7:0] value [0:7]; //value has 8 numbers with 8 bits each 
logic signed [8:0] pre_add [0:3];//8 bit+8bit can give max 9 bits
logic signed [16:0] pre_sum [0:3]; //9bits*8bits can give 17 bits max

always @(posedge clk)
begin

if(rst)
begin
value[0]<=0;
value[1]<=0;
value[2]<=0;
value[3]<=0;
value[4]<=0;
value[5]<=0;
value[6]<=0;
value[7]<=0;
end

else
begin
value[0]<=x;
value[1]<=value[0];
value[2]<=value[1];
value[3]<=value[2];
value[4]<=value[3];
value[5]<=value[4];
value[6]<=value[5];
value[7]<=value[6];
end

end

//now in symmetric Finite Instance Response we combine coefficients of h[i] with xi which is in 
//form of sample[i]

assign pre_add[0]=(value[0] + value[7]);
assign pre_add[1]=(value[1] + value[6]);
assign pre_add[2]=(value[2] + value[5]);
assign pre_add[3]=(value[3] + value[4]);

assign pre_sum[0]=pre_add[0]*h[0];
assign pre_sum[1]=pre_add[1]*h[1];
assign pre_sum[2]=pre_add[2]*h[2];
assign pre_sum[3]=pre_add[3]*h[3];

//finally set-up the value of y which is your final signal

assign y=(pre_sum[0] + pre_sum[1]  + pre_sum[2] + pre_sum[3]);

endmodule