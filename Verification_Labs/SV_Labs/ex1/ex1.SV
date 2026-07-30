module ex1;

int arr[$] = '{9, 7, 4, 6, 2, 8, 6 ,5};
int arr1[$], arr2[$];

initial begin
arr1 = arr[0: (arr.size()/2) - 1];
arr2 = arr[(arr.size()/2): arr.size()-1];
$display("original_arrays = %p | arr1 = %p | arr2 = %p",
          arr,                   arr1,       arr2);
end
endmodule