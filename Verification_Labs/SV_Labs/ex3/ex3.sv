module ex3;
int arr[] = '{45,34,67,89,78};
int max_1, max_2;
int tmp[$];

initial begin
max_1 = arr.max()[0];
tmp = arr.find() with (item != max_1);
max_2 = tmp.max()[0];

$display("second max is = %0d", max_2);
end

endmodule