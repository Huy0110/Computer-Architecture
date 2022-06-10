#include <stdio.h>

int main()
{
    // do
    // {
    //     char *string1;
    //     char *string2;
    //     int thoat = 0;
    //     printf("Nhap vao xau 1: ");
    //     scanf("%s", string1);
    //     printf("Nhap vao xau 2: ");
    //     scanf("%s", string2);

    //     for(int i = 0; i < len(string1); i++)
    //     {
    //         if((string1[i] <= 'z' && string[i] >= 'a')|| )
    //     }
    // }
    char* address;

    int i = 0;          // i là chỉ số ($t0)
    char* a = address;  // a chứa địa chỉ của xâu ($a1)
    void check_without_digit(int i)
    {
        a = a + i;      // *a = a[i], *a chứa địa chỉ thứ i của xâu ($a0 là a[i])
        if(*a == '\n')  // điều kiện dừng là đến cuối xâu bắt gặp '\n
        {
            exit_check_without_digit(); //đến hàm exit_check_without_digit()
        }
        if((a[i]<= 'z' && a[i] >= 'a') || (a[i] <= 'Z' && a[i] >= 'A') || a[i] == ' ') //kiểm tra điều kiện
        {
            i++; // nếu đúng thì tăng i và tiếp tục xét ở ký tự a[i+1]
            check_without_digit(i);
        }
        else
        {
            input_again(); // nếu không thỏa mãn thì yêu cầu nhập lại
        }
    }

    void exit_check_without_digit()
    {
        // không làm gì cả
    }


    int i = 0;          // i là chỉ số ($t0)
    char* a = address;  // a chứa địa chỉ của xâu ($a1)
    void while_name(int i)
    {
        a = a + i;      // *a = a[i], *a chứa địa chỉ thứ i của xâu (a[i] lúc này là $a0)
        if(*a == '\n')  // điều kiện dừng là đến cuối xâu bắt gặp '\n
        {
            exit_while_name_1(i); //đến hàm exit_while_name_1(i) để trả về độ dài
        }
        i++; //tăng i
        while_name_1(i); //tiếp tục xét ở a[i+1]
    }

    int s; //s là độ dài xâu ($s0)
    void exit_while_name(int i)
    {
        s = i + 0; //cập nhật s
    }

    int length = 0;


    int i = 0;          // i là chỉ số ($t0)
    char* a = address;  // a chứa địa chỉ của xâu ($a1)
    int s = length;   // s lưu độ dài (#s0)
    int s2 = finish; //là vị trí finish, nơi có khoảng trắng đầu kể từ end đổ về ($s2)
    i = s2 + 1; // i sẽ xét từ vị trí chữ cái đầu tiên trong tên
    void for2_name(int i)
    {
        if(i == s)
        {
            exit_for2_name(); // nếu i == s (đến cuối xâu) thì thoát
        }
        a = a + i;      // *a = a[i], *a chứa địa chỉ thứ i của xâu (a[i] lúc này là $a0)
        printf("%c", a[i]) // in ra ký tự thứ i ra màn hình
        i = i + 1; //tiếp tục tăng i
        for2_name(i); //tiếp tục xét ở a[i+1] 
    }
    void exit_for2_name()
    {
        print(" ");  //in ra ký hiệu space
    }

    

    int i = 0;          // i là chỉ số ($t0)
    char* a = address;  // a chứa địa chỉ của xâu ($a1)
    int s = length;   // s lưu độ dài (#s0)
    i = s - 1; // vì s là độ dài thực nên nếu muốn xét từ ký tự cuối thì i = s -1
    int s2; //là vị trí finish, nơi có khoảng trắng đầu kể từ end đổ về ($s2)
    void for1_name(int i)
    {
        if(i<0)
        {
            exit_for1_name(); // nếu i < 0 thì thoát
        }
        a = a + i;      // *a = a[i], *a chứa địa chỉ thứ i của xâu (a[i] lúc này là $a0)
        i = i -1;       // giảm i
        if(*a != ' ')  // điều kiện dừng là bắt gặp ' '
        {
            while_name_1(i); //tiếp tục xét ở a[i-1]
        }
        else
        {
            s2 = i + 1; //s2 là vị trí cần tìm, cập nhật s2 rồi out khỏi hàm
            break;
        }
        
    }
    void exit_for1_name()
    {
        // không làm gì
    }


    int i = 0;          // i là chỉ số ($t0)
    char* a = address;  // a chứa địa chỉ của xâu ($a1)
    int s2 = finish; //là vị trí finish, nơi có khoảng trắng đầu kể từ end đổ về ($s2)
    i = 0; // i sẽ xét từ vị trí chữ cái đầu tiên trong xâu
    void for3_name(int i)
    {
        if(i == s2)
        {
            exit_for3_name(); // nếu i == s2 (đến vị trí finish, nơi bắt đầu tên) thì thoát
        }
        a = a + i;      // *a = a[i], *a chứa địa chỉ thứ i của xâu (a[i] lúc này là $a0)
        printf("%c", a[i]) // in ra ký tự thứ i ra màn hình
        i = i + 1; //tiếp tục tăng i
        for3_name(i); //tiếp tục xét ở a[i+1] 
    }
    void exit_for3_name()
    {
        // không làm gì cả
    }
    

}