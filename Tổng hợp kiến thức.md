# Tổng hợp kiến thức Công nghệ web

## Bài 6: Controller

## Bài 7: View
### 1 - Giới thiệu View
- View - cung cấp giao diện cho người dùng
- View không tự truy cập trực tiếp mà được render bởi controller
- Controller cung cấp thông tin cho view bằng cách truyền "data tranfer object" gọi là model. View chuyển model này thành định dạng biểu diễn được cho người dùng

### 2 - Một số quy tắc
#### Return View trong Controller
- Mỗi __Controller__ có một thư mục tương ứng trùng tên trong thư mục __View__ 
- Ta có thể chỉ định View khi render
```c#
public ActionResult Index() {
  // Tìm đến file Index.cshtml trong thư mục View tương ứng
  return View("Index"); // = return View();
}

public ActionResult Index() {
  return View("NotIndex");
}

// Trả về View khác thư mục
public ActionResult Index() {
  return View("~/View/Example/Index.cshtml");
}
```
>> __ActionResult__ là kiểu mà có thể trả về lại nhiều thứ khác. nếu để __View__ thì ta chỉ có thể trả về __View__ nên để __ActionResutl__ sẽ linh động hơn

#### Truyền dữ liệu từ Controller sang Views thông qua ViewBag

#### Khai báo namespace trong tệp web config trong View để lúc nào cũng sử dụng được Models tại mọi chỗ
```xml
<pages pageBaseType="System.Web.Mvc.WebViewPage">       
  <namespaces>         
    <add namespace="System.Web.Mvc" />         
    <add namespace="System.Web.Mvc.Ajax" />         
    <add namespace="System.Web.Mvc.Html" />         
    <add namespace="System.Web.Routing" />         
    <add namespace="MyMvcProject.Models" />  <!--This is models namespace-->
  </namespaces>     
</pages> 
```

### 3 - Phân loại các loại View và cách tạo View
#### 3.1.  Layout/Master Page: Là thành phần giao diện dùng chung cho nhiều View
  - Layout Page thường dùng cho Razor engine. Có đuôi mở rộng là .cshtml
  - Master Pape dùng cho ASPX engine. 

#### 3.2. View: Tạo một view đầy đủ
#### 3.3 Patial View: View là một thành phần của View khác
- Là View cho phép sử dụng lại trong ứng dụng giống như use control
- Có đuôi mở rộng trong Razor Engine là .cshtml
- Sử dụng: class helper cung cấp một số phương thức cho View gọi là partial view
  + Html.Partial("tên_patial_view"): app sẽ render ra patial view sau khi render xong view chính;
  + Html.RenderPartial("tên_partial_view"): gọi song song với view chính;
__Example__

- File __ListSanPham.cshtml__
```html
@model IEnumerable<MyMvcProject.Models.SanPhamModels> 
@if(Model!=null) 
{   
  <table>         
    <tr> 
    <th> Mã Sản phẩm </th>             
    <th>Tên Sản phẩm </th>             
    <th> Giá sản phẩm</th> </tr>     
    @foreach (var item in Model) {         
      <tr>
        <td>  @Html.DisplayFor(modelItem => item.MaSP) </td>             
        <td>  @Html.DisplayFor(modelItem => item.TenSP) </td>             
        <td>  @Html.DisplayFor(modelItem => item.GiaSP)</td>
      </tr>     
    }     
  </table> 
}
```
- Gọi file trong view cùng thư mục __Index.cshtml__
```html
@{ Layout = null;} 
<!DOCTYPE html> 
<html> 
<head>     
  <meta name="viewport" content="width=device-width" />     
  <title>UserPartialView</title> 
</head> 
<body>     
  <div>
    @Html.Partial("ListSanPham")     
  </div> 
</body> 
</html> 
```
>> Trong Controller ta có thể thay thế return View() => return PartialView()

#### 3.4: ViewStart
#### 3.5: Layout

### 4: Rarzor Enginer - Chú ý
### 5: HTML Helpers - Chú ý
#### 5.1: AcitonLink - sinh ra hyperlink tới một controller action khác.
__Example__: Link và pass param tới action trong cùng controller và khác controller
```html
<!--Nhảy sang action khác-->
@Html.ActionLink("Tên link", "tên action", new {Id = 3});
@Html.ActionLink("Tên link", "tên action", "tên controller", new {Id = 3});
<!--Truyền dữ liệu tới action khác-->
@Html.ActionLink("Tên link", "tên action", new {Id = 3});
@Html.ActionLink("Tên link", "tên action", "tên controller", new {Id = 3});
```
#### 5.2: Render patial View
#### Giới thiệu
