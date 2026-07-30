module ex4;
int arr[] = '{8, 3, 3, 4, 5, 6, 3, 5, 4, 6, 8, 7, 6, 4, 3, 5, 6};

int uniques[$];
int occur[$];

initial begin
uniques = arr.unique();

foreach (uniques[i]) begin
    occur = arr.find() with (item == uniques[i]);
    $display("number = %0d, occured = %0d", 
              uniques[i],   occur.size());
end
end

endmodule