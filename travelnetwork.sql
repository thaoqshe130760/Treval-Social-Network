USE [WebPrject_DBtest]
GO
/****** Object:  FullTextCatalog [title_fulltext]    Script Date: 3/6/2020 4:16:00 PM ******/
CREATE FULLTEXT CATALOG [title_fulltext] AS DEFAULT
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/6/2020 4:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[Text] [nvarchar](1000) NULL,
	[CommentTime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 3/6/2020 4:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhotoName] [varchar](100) NOT NULL,
	[Title] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poster]    Script Date: 3/6/2020 4:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Image] [varchar](100) NULL,
	[Text] [ntext] NULL,
	[PostingDate] [date] NULL,
	[Title] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 3/6/2020 4:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[Content] [nvarchar](100) NOT NULL,
	[Text] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 3/6/2020 4:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](100) NULL,
	[ImageName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicOfPoster]    Script Date: 3/6/2020 4:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicOfPoster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContentID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/6/2020 4:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [bit] NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[DateOfbirth] [date] NULL,
	[Hobbies] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPhoto]    Script Date: 3/6/2020 4:16:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPhoto](
	[UserID] [int] NOT NULL,
	[PhotoID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [UserID], [PostID], [Text], [CommentTime]) VALUES (18, 3, 37, N'hhj', CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Comment] ([ID], [UserID], [PostID], [Text], [CommentTime]) VALUES (19, 3, 37, N'ljlkk', CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Comment] ([ID], [UserID], [PostID], [Text], [CommentTime]) VALUES (20, 3, 42, N'a
', CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Comment] ([ID], [UserID], [PostID], [Text], [CommentTime]) VALUES (22, 4, 43, N'hello', CAST(N'2019-11-13' AS Date))
INSERT [dbo].[Comment] ([ID], [UserID], [PostID], [Text], [CommentTime]) VALUES (1013, 4, 43, N'ksjahfsfe', CAST(N'2020-03-06' AS Date))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([ID], [PhotoName], [Title]) VALUES (4, N'user_avatar.png', N'')
INSERT [dbo].[Photo] ([ID], [PhotoName], [Title]) VALUES (5, N'u5.jpg', N'Thi sao nao')
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Poster] ON 

INSERT [dbo].[Poster] ([ID], [UserID], [Image], [Text], [PostingDate], [Title]) VALUES (37, 4, N'windows-7-10-aio_800x450_800x450.jpg', N'Sau 10 năm, hỗ trợ dành cho Windows 7 sẽ kết thúc vào ngày 14 tháng 1 năm 2020. Chúng tôi biết rằng sự thay đổi có thể gây khó khăn. Vì vậy, chúng tôi luôn sẵn sàng trợ giúp bạn bằng cách đưa ra đề xuất về những việc cần làm tiếp theo và trả lời các câu hỏi liên quan đến việc kết thúc hỗ trợ.', CAST(N'2019-11-12' AS Date), N'Windows 7 sắp kết thúc')
INSERT [dbo].[Poster] ([ID], [UserID], [Image], [Text], [PostingDate], [Title]) VALUES (38, 4, N'Samsung-A50s-12.jpg', N'Được ra mắt cách đây không lâu, Galaxy A50s là một bản nâng cấp của chiếc Galaxy A50 ra mắt hồi đầu năm. Tiếp tối sự thành công của chiếc thế hệ trước, chiếc A50s tiếp tục nhận được sự hưởng ứng từ giới trẻ. Vậy ở thời điểm hiện tại khi mà có khá nhiều mẫu smartphone mới được ra mắt thì chiếc Galaxy A50s còn đáng mua hay không?

Ở thời điểm hiện tại, chiếc Galaxy A50s đang có mức giá dao động từ 6 cho đến 6,5 triệu đồng. Và đây là sản phẩm tiếp nối xu thế "cao cấp hóa" smartphonet tầm trung của Samsung: mang những tính năng cao cấp xuống sản phẩm tầm trung. Về vấn đề này thì mình đã có video trên kênh, anh em xem lại bên dưới nhé:


Với việc được Samsung ưu ái trang bị những tính năng cao cấp, chiếc A50s vẫn có thể tự tin để cạnh tranh với các đối thủ trong phân khúc vừa ra mắt gần đây như là Oppo A9, Reno2 hay thậm chí là những chiếc máy cũ iPhone 6/6+.


Điểm đầu tiên phải nhắc đến ở chiếc A50s đó chính là thiết kế phá cách, trẻ trung. Ở đây chúng ta có một mặt lưng bóng bẩy và nổi bật bởi những họa tiết vân tam giác đan xen nhau. Với phiên bản màu xanh thì cộng với hiệu ứng ánh sáng, chiếc A50s trở nên lung linh huyền ảo và trở thành một món phụ kiện thời trang của các bạn trẻ năng động chứ không phải là một chiếc điện thoại thông thường nữa. Mặt lưng của chiếc A50s không hề kém cạnh khi đặt cạnh những chiếc máy vừa mới ra mắt như Reno 2F hay Redmi Note 8 Pro.


Không chỉ nổi bật về thiết kế mặt lưng, mà khi anh em quay ra mặt trước, A50s cũng không hề kém cạnh so với những chiếc máy khác khi có một màn hình tràn viền kích thước 6.4 inch, tỉ lệ 19,5:9 cùng độ phân giải full HD+. Và đặc biệt là ở đây chiếc A50s được Samsung ưu ái trang bị tấm nền SuperAMOLED, một tấm nền mà trước giờ chỉ xuất hiện trên các mẫu flagship của hãng. Chiếc Galaxy A50s mang đến cho anh em một chất lượng hiển thị rất tốt, hình ảnh sắc nét và màu sắc rực rỡ


Có thể nói màn hình trên chiếc Galaxy A50s sẽ mang lại cho anh em một trải nghiệm giải trí xem phim, chiến game cực đã. Bên cạnh đó thì cũng như đàn anh A50 của mình, chiếc A50s tiếp tục được trang bị cảm biến vân tay quang học dưới màn hình. Bây giờ nó đã được cải thiện hơn rất nhiều so với thế hệ trước, hoạt động nhanh và chính xác hơn.


Đối tượng chiếc Galaxy A50s hướng tới là những bạn trẻ năng động bởi vậy không thể nào không nhắc đến camera ở đây. Trên chiếc Galaxy A50s đã thực sự được nâng cấp. Chúng ta sẽ có camera chính độ phân giải 48MP f/2.0 thay vì 25MP f/1.7 như thế hệ trước. Nhờ vậy chiếc A50s vẫn có thể đứng vững trong phân khúc khi so sánh với các đối thủ khác.


Hai camera còn lại vẫn được Samsung giữ nguyên như thế hệ cũ, camera góc siêu rộng 8 MP, khẩu độ f/2.2 và camera 5 MP, khẩu độ f/2.2 để thu độ sâu phục vụ việc xóa phông. Bộ 3 camera này của chiếc Galaxy A50s có thể đáp ứng thoải mái nhu cầu "sống ảo" của các bạn trẻ hiện nay.
Camera chính cho ra những bức hình có độ chi tiết cao, tái hiện màu sắc khá chân thực chứ không bị đẩy lên quá đà điều mà camera trên điện thoại Samsung hay mắc phải.


Khả năng chụp thiếu sáng trên chiếc A50s cũng đã được cải thiện, giữ được độ chi tiết và không bị quá bệt.


Ống kính góc rộng cũng là một điểm nổi bật của chiếc A50s, tốc độ lấy nét cũng như chất lượng ảnh đã được cải thiện đáng kể. Như bản thân mình thì đây lại là camera mình sử dụng nhiều nhất, bởi nó cho ra những bức hình khác biệt và ấn tượng hơn so với những camera còn lại.


Tiếp nữa với camera xóa phông, chắc hẳn những bạn nữ sẽ rất quan tâm tới camera này. Trên chiếc Galaxy A50s, camera xóa phông hoạt động tốt, nhưng anh em lưu ý là chỉ chụp trong điều kiện đủ sáng mà thôi. Bù đắp lại thì chị em sẽ có artbokeh với nhiều hình dễ thương như trái tim, máy bay, bông tuyết,....



Bên cạnh bộ 3 camera ở mặt sau thì chiếc A50s cũng có sự nâng cấp đáng giá với camera trước, độ phân giải được nâng lên 32MP thay vì 25MP như thế hệ trước. Bản thân mình thì hiếm khi sử dụng camera trước, tuy nhiên các bạn nữ chắc hẳn sẽ sử dụng thường xuyên, và chiếc A50s sẽ không làm các bạn thất vọng. Những bức hình "seo-phì" ở đây có độ chi tiết cao và đi kèm là đủ các chế độ làm đẹp nên chị em sẽ luôn có những bức hình chất lượng và lung linh.


Cuối cùng là về thời lượng pin và hiệu năng của chiếc Galaxy A50s. Chiếc A50s được hãng trang bị viên pin 4000mAh, đáp ứng thoải mái một ngày làm việc. Cùng với đó là công nghệ sạc nhanh, anh em chỉ cần cắm sạc 10 - 15 phút là đủ để sử dụng 3h xem phim hoặc gần 10h nghe nhạc liên tục.


Cấu hình không phải là điểm mạnh trên chiếc A50s, chúng ta sẽ có con chip Exynos 9611, 4GB RAM và 64GB bộ nhớ trong. Tuy nhiên chiếc Galaxy A50s vẫn xử lý các tác vụ thông thường một cách mượt mà, thậm chí nó cũng chiến tốt các tựa game mobile như là Liên Quân Mobile hay PUBG Mobile. Tất nhiên anh em chú ý để setting ở mức Medium để có trải nghiệm tốt nhất có thể.

Tổng kết lại, mặc dù đã ra mắt khá lâu nhưng chiếc Galaxy A50s vẫn là một sự lựa chọn hợp lý trong phân khúc 6 - 7 triệu đồng. Nó vẫn mang trong mình nhiều điểm mạnh khi so sánh với các đối thủ khác như là Oppo A9, Reno2 F hay Xiaomi Redmi Note 8 Pro.', CAST(N'2019-11-12' AS Date), N'Galaxy A50s còn đáng mua ở thời điểm hiện tại?')
INSERT [dbo].[Poster] ([ID], [UserID], [Image], [Text], [PostingDate], [Title]) VALUES (39, 4, N'samsung-galaxy-fold-new-0644.webp', N'Siêu phẩm mới nhất của Samsung trong năm nay, chiếc Galaxy Fold - mẫu điện thoại gập đầu tiên trên thế giới sẽ được ra mắt tại Việt Nam trong tháng 11 này.

Galaxy Fold là một thiết bị công nghệ của thập kỷ, bởi màn hình gập Infinity Flex Display đầu tiên trên thế giới cùng với cơ chế gập mở bản lề mượt mà tựa trang sách, khai mở tầm nhìn phi thường ngay trong tầm tay. Vẻ ngoài thanh mảnh, tinh gọn và đẳng cấp của Galaxy Fold cũng là một kiệt tác với sự hoàn hảo được chăm chút trên từng đường nét. Galaxy Fold là biểu tượng của triết lý thiết kế được Samsung sáng tạo cho tương lai.

Kết quả hình ảnh cho galaxy fold
Hội tụ đột phá về hiển thị, kết hợp với chế tác tinh mỹ, Galaxy Fold đại diện cho sự giao thoa giữa tính sáng tạo và duy mỹ trong công nghệ, có khả năng thỏa mãn cả những tín đồ công nghệ cầu toàn nhất, giúp họ sống bứt phá, hiện thực hóa những điều không thể.

Kết quả hình ảnh cho galaxy fold
Và không để người dùng phải đợi chờ lâu nữa, thì Samsung đã có thông tin chính thức về việc ra mắt chiếc Galaxy Fold tại thị trường Việt Nam. Galaxy Fold sẽ được bán với số lượng giới hạn tại thị trường Việt Nam với giá dự kiến trên 50,000,000 VNĐ.
Với mức giá đó thì chiếc Galaxy Fold sẽ trở thành chiếc smartphone đắt nhất của Samsung từ trước tới nay tại thị trường Việt Nam, và nó cũng vượt qua mốc giá cao nhất của iPhone chính hãng chiếc iPhone 11 Pro Max - 44 triệu đồng.', CAST(N'2019-11-12' AS Date), N'Galaxy Fold sẽ ra mắt tại Việt Nam trong tháng 11 này!')
INSERT [dbo].[Poster] ([ID], [UserID], [Image], [Text], [PostingDate], [Title]) VALUES (40, 4, N'Dell_G-Series__1_of_1_.jpg', N'Tại sự kiện Game It Your Way được tổ chức tại Landmark 81, Tp.HCM, Dell Việt Nam chính thức giới thiệu dòng laptop gaming G-series 2019 với dải sản phẩm đầy đủ từ G7 15 7590, G5 15 5590 và cả G3 15 3590. Đây cũng là thế hệ laptop gaming được Dell thiết kế với nhiều cải tiến, kích cỡ mỏng nhẹ hơn, nâng cấp cấu hình phần cứng lẫn tiện ích hỗ trợ, giúp người dùng khai thác tối đa sức mạnh hệ thống.

Ông Trần Đức Trung, Giám đốc kênh bán lẻ khu vực Nam Á của Dell Technologies cho biết “G-series 2019 đã thiết lập một tiêu chuẩn phần cứng mới để đáp ứng các kỳ vọng khác nhau của game thủ. Những cải tiến của sản phẩm mang lại trải nghiệm game trên máy tính mượt mà hơn”. Đây cũng là cam kết mà Dell xuyên suốt 20 năm không ngừng nghỉ nhằm thúc đẩy sự phát triển của ngành công nghiệp game.

Cảm hứng thiết kế từ game thủ
Thiết kế G-series 2019 dựa trên những phản hồi tích cực từ game thủ. Sản phẩm trang bị màn hình 15 inch Full HD, panel IPS với viền màn hình mỏng ở 3 cạnh, lớp chống chói phủ ngoài bề mặt đảm bảo góc quan sát rộng, dễ nhìn trong các môi trường khác nhau.


Bên cạnh màn hình 144Hz và hỗ trợ G-sync, G-series 2019 còn đi kèm tiện ích Alienware Command Center mang lại trải nghiệm game liền mạch, thoải mái hơn. Thiết kế bàn phím với LED RGB bên dưới, có thể tùy biến 4 vùng linh hoạt theo sở thích cá nhân. Hệ thống tản nhiệt cải tiến giúp việc thoát nhiệt nhanh, hiệu quả và ít tiếng ồn khi hoạt động.


Và một thành phần không thể thiếu trong dòng laptop chuyên game là card mạng Killer, cho phép thiết lập các chế độ ưu tiên băng thông, giảm độ trễ để mang lại sự ổn định khi chơi game online. Công nghệ tăng cường Nahimic Sound Center nâng chất lượng âm thanh thêm một bậc cho nhu cầu giải trí. Không gian âm thanh mở rộng với âm trầm ấm hơn, có sự sâu lắng và đủ lực để thể hiện tốt các hiệu ứng âm thanh, vốn được nhà sản xuất game chăm chút không kém phần hình ảnh.



Không chỉ trang bị sẵn SSD M.2 NVMe đến 512GB, các cỗ máy game mới của Dell còn có cả khe M.2 thứ hai để người dùng nâng cấp dung lượng khi cần. Ngoài ra, G-series 2019 còn hỗ trợ nhiều cổng kết nối phổ biến hiện nay như HDMI 2.0, USB 3.1, đầu đọc thẻ SD/MicroSD, khóa chống trộm và đầu cắm tai nghe, micro.

Intel Core i thế hệ 9 kết hợp sức mạnh đồ họa GeForce RTX 20-series và GTX 16-seriesthỏa mãn nhu cầu người dùng trong công việc lẫn giải trí di động.
G-series 2019 được Dell thiết kế lại với kích cỡ mỏng nhẹ hơn, nâng cấp cấu hình phần cứng cùng những tiện ích hỗ trợ người dùng. Về phần cứng, G-series 2019 xây dựng trên nền tảng Intel Coffee Lake refresh; chẳng hạn mẫu chip 6 nhân 12 luồng i7-9750H, kết hợp sức mạnh đồ họa GeForce RTX 20-series hoặc GTX 16-series (tùy cấu hình), đủ mạnh để chơi được các tựa game AAA hiện nay hoặc dùng cho công việc biên tập, xử lý hình ảnh và dựng phim.
G-series 2019 được Dell thiết kế lại với kích cỡ mỏng nhẹ hơn, nâng cấp cấu hình phần cứng cùng những tiện ích hỗ trợ người dùng. Về phần cứng, G-series 2019 xây dựng trên nền tảng Intel Coffee Lake refresh; chẳng hạn mẫu chip 6 nhân 12 luồng i7-9750H, kết hợp sức mạnh đồ họa GeForce RTX 20-series hoặc GTX 16-series (tùy cấu hình), đủ mạnh để chơi được các tựa game AAA hiện nay hoặc dùng cho công việc biên tập, xử lý hình ảnh và dựng phim.

Dell G7 15 7590 -Mỏng mà mạnh

G7 15 là mẫu máy mỏng nhẹ nhất của dòng G-series từ trước đến nay. Thiết kế G7 thể hiện sự hiện đại, tính di động linh hoạt với độ mỏng chỉ 19,9 mm, nặng 2,62 kg đồng thời vẫn thể hiện được sự mạnh mẽ của cấu hình phần cứng. Lớp vỏ hợp kim nhôm đảm bảo sự mỏng nhẹ, góp phần vào việc làm mát linh kiện phần cứng bên trong theo dạng tản nhiệt thụ động. Đặc biệt G7 15 trang bị pin Lithium dung lượng đến 90 WHr, giúp việc chơi game di động thoải mái hơn. Tại Việt Nam, G7 15 hiện có màu xám Abyss.

Dell G5 15 5590 - Chiến game hiệu quả

G5 5590 thu hút sự chú ý người dùng bởi sự kết hợp hài hòa giữa tông đen tuyền cùng các điểm nhấn màu xanh dương. Sản phẩm có độ dày 23,7mm, vùng kê tay bàn phím bằng hợp kim nhôm. Màn hình 15 inch Full HD với độ sáng cao, góc nhìn rộng, tấm nền IPS giúp hình ảnh hiển thị chất lượng, màu sắc ít biến đổi khi nhìn từ các góc khác nhau.
Cổng kết nối thiết bị ngoại vi cũng là điểm nhấn của G5 15 5590 khi trang bị cổng HDMI 2.0 tiêu chuẩn, băng thông đủ rộng để xuất tín hiệu hình ảnh ra màn hình ngoài độ phân giải 4K@60 fps. Ngoài ra còn có USB 3.1 type C chuẩn Power Delivery, hỗ trợ cả Thunderbolt 3, DisplayPort 1.2 trong cùng kết nối vật lý. G5 5590 có mặt ở thị trường Việt Nam với màu đen vũ trụ và các điểm nhấn xanh dương, mang lại phong cách mạnh mẽ cho game thủ

Dell G3 3590 - Hài hòa giữa hiệu năng và chi phí

G3 3590 hướng đến giới trẻ và cũng là mẫu laptop game tầm trung đáng cân nhắc hiện nay. Sản phẩm mang dáng vẻ hiện đại, chất lượng phần cứng theo tiêu chuẩn của Dell cùng cấu hình đủ mạnh cho nhu cầu chơi game giải trí lẫn đáp ứng công việc hàng ngày.
G3 3590 có độ mỏng chỉ 21,6mm, nặng khoảng 2,34 kg, đi kèm pin 51Whr và nhất là màn hình viền mỏng ở cả 3 cạnh giúp định hình sản phẩm. Sự thay đổi này không chỉ giúp hiển thị nhiều thông tin hơn trong cùng kích cỡ màn hình mà còn mang lại cảm giác nhẹ nhàng, linh hoạt hơn đối với game thủ thường tham dự các buổi offline, LAN party. G3 3590 có mặt tại thị trường Việt Nam với màu đen Eclipse.

Alienware Command Center
Đi kèm G-series 2019 là bộ tiện ích Alienware Command Center, cho phép game thủ thiết đặt các trải nghiệm cá nhân như tùy chỉnh hệ thống LED nền, chức năng quản lý nguồn, nhiệt độ phần cứng, âm thanh cũng như các game cài đặt trên máy

Khách hàng khi mua sản phẩm chính hãng Dell Gaming G-series tại Việt Nam sẽ được sử dụng dịch vụ bảo hành tận nơi Premium Support, gồm cả dịch vụ bảo hành thay thế linh kiện tại nơi sử dụng hỗ trợ người dùng qua tổng đài 1800 545455, hoạt động 24/7 (cả ngày lễ).
Các sản phẩm G-Series mới có giá bán tham khảo:

Dell G3 15 (3590) có giá từ 23,490,000 VND.
Dell G5 15 (5590) có giá từ 28,990,000 VND.
Dell G7 15 (7590) có giá từ 49,990,000 VND.', CAST(N'2019-11-12' AS Date), N'Dell chính thức ra mắt G-Series 2019 tại Việt Nam: mới mẻ, mạnh mẽ và hoành tráng!')
INSERT [dbo].[Poster] ([ID], [UserID], [Image], [Text], [PostingDate], [Title]) VALUES (41, 4, N'HP_G2__1_of_1_-8.jpg', N'Những bộ case văn phòng trước giờ vẫn luôn bị gắn mác là to nặng, cục mịch, tuy nhiên hôm nay mình sẽ giới thiệu đến anh em bộ case đồng bộ dành cho giới văn phòng

Hôm trước thì mình có thấy bộ case đồng bộ của HP đi kèm cả màn hình khá là đẹp nên đã hốt ngay về để set up cho góc sáng tạo của anh ThinkView, tuy nhiên thì lại bị phòng kế toán hack mất. Cụ thể anh em có thể xem lại video bên dưới


Case HP Desktop Pro G2 Microtower

Bộ case có tên khá là dài này ở đây sở hữu một thiết kế đơn giản, nhỏ gọn và vẫn đẹp. Cấu hình của case HP Pro G2 không phải quá mạnh nhưng vẫn đủ để đáp ứng nhu cầu làm việc văn phòng cơ bản.


Mình vẫn sử dụng các tác vụ văn phòng rất ổn trên bộ case này
Và với con chip Intel Core i3 8100, vẫn còn có card đồ họa tích hợp Intel UHD 630 nên anh em có thể chiến tốt mấy tựa game nhẹ nhàng online kiểu như Liên Minh Huyền Thoại.


Màn hình HP Z24nf G2 Display

Mẫu màn hình HP Z24nf G2 Display cũng mang một thiết kế rất hiện đại và đơn giản như bộ case G2 Pro. Hai điều mình thích nhất ở đây là viền màn hình rất mỏng cùng với chân đế rất cơ động.
Không chỉ có thiết kế đẹp, mà chiếc màn hình này cũng có chất lượng hiển thị khá là ổn với độ sai lệch màu Delta E chỉ là 1.09


Tổng kết lại có thể nói rằng nếu như anh em chỉ có nhu cầu sử dụng văn phòng bình thường thì bộ case đồng bộ và màn hình đến từ thương hiệu HP ở trên sẽ là một sự lựa chọn hợp lý.', CAST(N'2019-11-12' AS Date), N'Set up góc làm việc cực đẹp cho dân văn phòng!')
INSERT [dbo].[Poster] ([ID], [UserID], [Image], [Text], [PostingDate], [Title]) VALUES (42, 4, N'ViewSonic_VA__9_of_12_.jpg', N'Hôm nay mình sẽ giới thiệu đến anh em một mẫu màn hình văn phòng đến từ thương hiệu ViewSonic. Hiện tại mẫu màn hình này có mức giá rất tốt và chất lượng cũng khá là ổn với 2 phiên bản kích thước khác nhau gồm màn hình 24" VA2419-SH và màn hình 27" VA2719-SH

VA2719Sh là một chiếc màn hình 27 inch đến từ thương hiệu ViewSonic. Hiện tại mẫu màn hình này đang có giá bán khá tốt chỉ vào khoảng gần 4 triệu đồng. Với nhu cầu sử dụng cơ bản thì đây là một sự lựa chọn đáng để cân nhắc.

Thiết kế
VA2719Sh có thiết kế khá là đơn giản, không quá nổi bật. Ở đây chúng ta sẽ không có viền màn hình siêu mỏng, tuy nhiên thì ở mặt trước viền màn hình lại được làm khá là cân đối.


Chân đế của chiếc VA2719Sh vừa là điểm cộng vừa là điểm trừ. ĐIểm cộng ở đây là anh em sẽ có chân đế được làm từ kính trông khá là đẹp và rất khó xước, khá nhiều mẫu màn hình khác trong phân khúc này sẽ chỉ có chất liệu nhựa mà thôi. Tuy nhiên điểm trừ ở đây là chân đế này lại không cơ động cho lắm, anh em sẽ chỉ có thể ngửa lên và ngửa xuống chứ không nâng lên, hạ xuống hay quay trái quay phải được.


Chân đế ở đây khá là đẹp nhưng lại không cơ động cho lắm.
Các nút bấm màn hình cũng được chuyển sang mặt sau và mặt trước ở góc phải sẽ chỉ có ký hiệu các phím.


Là một mẫu màn hình hướng tới đối tượng là dân phòng với nhu cầu sử dụng cơ bản nên VA2719Sh cũng không trang bị quá nhiều cổng kết nối. Chúng ta sẽ có 1 cổng HDMI, 1 cổng VGA mà thôi.
Ngoài ra thì với VA2719Sh anh em cũng có thể treo lên tường được với chuẩn VESA 100x100mm .

Chất lượng hình ảnh
Với VA2719Sh chúng ta sẽ có một chiếc màn hình sử dụng tấm nền IPS với kích thước 27 incch, độ phân giải Full HD. Đây là độ phân giải phổ biến trong phân khúc giá rẻ này, với kích thước 27 inch chiếc màn này vẫn hiển thị hình ảnh rõ nét.
Mình cũng đã sử dụng thiết bị chuyên dụng SpyderX Elite để cân lại mẫu màn hình, kết quả sau khi cân cũng khá là ổn.


VA2819Sh có độ bao phủ màu lên đến 91% sRGB, 72% adobeAGB và 72% P3 và độ sáng ở đây cũng khá là ổn ở mức 300 nits.


Bên cạnh độ bao phủ màu thì độ sai lệch màu trên chiếc VA2719Sh cũng khá là thấp, delta E chỉ là 1.33. Với thông số sau khi cân lại như trên thì chiếc VA2719Sh vẫn đáp ứng được nhu cầu làm đồ họa cơ bản chứ không chỉ là văn phòng bình thường.
Và trải nghiệm thực tế khi sử dụng thì VA2819Sh hiển thị màu sắc khá là tươi tắn và sống động.



VA2719Sh cũng cho góc nhìn rộng 178 độ và nó thoải mái đáp ứng nhu cầu sử dụng cơ bản của anh em giới văn phòng. Ngoài ra với kích thước 27 inch, anh em có thể chia màn hình ra để làm trực tiếp nhiều tác vụ, ví dụ như vừa gõ văn bản vừa xem Youtube hay lướt ThinkView vậy.


Ngoài ra thì mẫu màn hình VA2719Sh cũng khá là tiết kiệm điện, nó đạt 4/6 sao về Energy Rating.


Nếu như anh em không gian làm việc không được rộng rãi thoải mái cho lắm thì có thể lựa chọn phiên bản 24 inch của mẫu màn hình này, với tên mã là VA2419Sh. Ngoài kích thước nhỏ hơn ra thì mọi thông số khác đều giữ nguyên như trên chiếc VA2719Sh.


Tổng kết

Có thể nói VA2719Sh và VA2419Sh mặc dù là màn hình hướng tới đối tượng người dùng văn phòng nhưng nó vẫn có chất lượng hiển thị màu sắc khá là tốt. Thiết kế đẹp, đơn giản cũng đã bù đắp phần nào một số điểm trừ nho nhỏ như chân đế không được linh hoạt, viền màn hình chưa được mỏng cho lắm. Nếu như anh em đang tìm kiếm một chiếc màn hình cho sử dụng cho nhu cầu làm việc cơ bản thì đây sẽ là một sự lựa chọn đáng cân nhắc.
Anh em có thể xem thêm thông tin sản phẩm ở link dưới nhé:
VA2419-Sh: http://bit.ly/VA2419Sh
VA2719-SH: http://bit.ly/VA2719Sh', CAST(N'2019-11-12' AS Date), N'Màn hình văn phòng giá tốt ViewSonic VA2719Sh')
INSERT [dbo].[Poster] ([ID], [UserID], [Image], [Text], [PostingDate], [Title]) VALUES (43, 4, N'458100-PFM5O5-305.jpg', N'hello', CAST(N'2019-11-13' AS Date), N'Cần tư vấn mua laptop từ 15-20 triệu!')
SET IDENTITY_INSERT [dbo].[Poster] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([ID], [Text], [ImageName]) VALUES (5, N'Smart Phone', N'Samsung-A50s-18.jpg')
INSERT [dbo].[Topic] ([ID], [Text], [ImageName]) VALUES (6, N'Laptop', N'laptop.jpg')
INSERT [dbo].[Topic] ([ID], [Text], [ImageName]) VALUES (7, N'Windows', N'Windows-10.jpg')
INSERT [dbo].[Topic] ([ID], [Text], [ImageName]) VALUES (8, N'MacOS', N'wordpress.png')
INSERT [dbo].[Topic] ([ID], [Text], [ImageName]) VALUES (9, N'Desktop', N'microsoft-surface.jpg')
INSERT [dbo].[Topic] ([ID], [Text], [ImageName]) VALUES (10, N'AMD', N'amd.jpg')
INSERT [dbo].[Topic] ([ID], [Text], [ImageName]) VALUES (11, N'Nvidia', N'geforce-rtx-2080.jpg')
SET IDENTITY_INSERT [dbo].[Topic] OFF
SET IDENTITY_INSERT [dbo].[TopicOfPoster] ON 

INSERT [dbo].[TopicOfPoster] ([ID], [ContentID], [PostID]) VALUES (19, 7, 37)
INSERT [dbo].[TopicOfPoster] ([ID], [ContentID], [PostID]) VALUES (20, 5, 38)
INSERT [dbo].[TopicOfPoster] ([ID], [ContentID], [PostID]) VALUES (21, 5, 39)
INSERT [dbo].[TopicOfPoster] ([ID], [ContentID], [PostID]) VALUES (22, 6, 40)
INSERT [dbo].[TopicOfPoster] ([ID], [ContentID], [PostID]) VALUES (23, 9, 41)
INSERT [dbo].[TopicOfPoster] ([ID], [ContentID], [PostID]) VALUES (24, 9, 42)
INSERT [dbo].[TopicOfPoster] ([ID], [ContentID], [PostID]) VALUES (25, 5, 43)
SET IDENTITY_INSERT [dbo].[TopicOfPoster] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [AccountType], [Username], [Password], [DisplayName], [DateOfbirth], [Hobbies]) VALUES (3, 0, N'datdt', N'1', N'Dat Oc Cho', NULL, NULL)
INSERT [dbo].[User] ([ID], [AccountType], [Username], [Password], [DisplayName], [DateOfbirth], [Hobbies]) VALUES (4, 0, N'thaoqs', N'1', N'Nam Dang', CAST(N'2019-11-11' AS Date), N'123 zo')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserPhoto] ([UserID], [PhotoID]) VALUES (3, 4)
INSERT [dbo].[UserPhoto] ([UserID], [PhotoID]) VALUES (4, 5)
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (getdate()) FOR [CommentTime]
GO
ALTER TABLE [dbo].[Photo] ADD  DEFAULT ('user_avatar.png') FOR [PhotoName]
GO
ALTER TABLE [dbo].[Topic] ADD  DEFAULT ('wordpress.png') FOR [ImageName]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [AccountType]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Poster] ([ID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Poster]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Poster] ([ID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[TopicOfPoster]  WITH CHECK ADD FOREIGN KEY([ContentID])
REFERENCES [dbo].[Topic] ([ID])
GO
ALTER TABLE [dbo].[TopicOfPoster]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Poster] ([ID])
GO
ALTER TABLE [dbo].[UserPhoto]  WITH CHECK ADD FOREIGN KEY([PhotoID])
REFERENCES [dbo].[Photo] ([ID])
GO
ALTER TABLE [dbo].[UserPhoto]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
