module ex2;
    int arr[] = '{0, 0, 0, 0, 1, 1, 1, 1, 5, 4, 4, 4, 4, 4, 5};
    int num, cnt;
    int num_max_cnt, max_cnt;

    initial begin
        num = arr[0];
        cnt = 1;
        num_max_cnt = num;
        max_cnt = cnt;

        for (int i = 1; i < arr.size(); i++) begin
            if (arr[i] == num)
                cnt++;
            else begin
                if (cnt > max_cnt) begin
                    max_cnt = cnt;
                    num_max_cnt = num;
                end
                num  = arr[i];
                cnt = 1;
            end

        end

if (cnt > max_cnt) begin
    max_cnt = cnt;
    num_max_cnt = num;
    end

$display("Number = %0d", num_max_cnt);
$display("conscutive frequncy= %0d", max_cnt);

    end

endmodule