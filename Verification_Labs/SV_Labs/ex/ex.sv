module ex;

int arr[] = {1, 2, 3, 4, 5, 8, 9};
int arr1[$], arr2[$];

initial begin 

foreach(arr[i]) begin
    if(arr[i] % 2 == 0) 
        arr1.push_back(arr[i]);
    else 
        arr2.push_back(arr[i]);

end

$display ("original array = %p", arr);
$display ("even array = %p", arr1);
$display ("odd array = %p", arr2);

end
endmodule