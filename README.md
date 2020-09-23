 # SISTThesis
 LaTeX template for SIST of ShanghaiTech University
 
 SISTThesis是符合上海科技大学信息学院博士后工作报告／研究生毕业论文格式要求的LaTeX模板，目的是简化工作报告／毕业论文的撰写，使作者可以将精力集中到报告／论文的内容上而不是浪费在版面设置上。现支持博士后工作报告以及博士和硕士毕业论文的格式。因为上海科技大学尚未发布博士／硕士学位论文的格式要求，因此模板主要根据博士后研究工作报告的撰写要求编写，待学位论文格式要求发布之后，将对学位论文部分进行相应的修改。

# 免责声明
本模板为作者根据博士后工作报告/毕业论文的要求编写, 由于个人精力有限, 难免有疏漏之处. 本人不对通过本模板撰写的工作报告/论文可以通过格式审查作任何明示或暗示的保证. 编译之后的文档是否符合工作报告/毕业论文的格式要求,需要使用者自行判断.

# 模板下载
请[下载](https://github.com/sslchi/SISTThesis)模板，里面包括具体使用说明以及示例文档：

* 模板使用说明 (main.pdf)
* 示例文档 (main.tex)

# CTEX版本说明
目前可以确认的是，CTeX 2.9.2.164可以正常运行本模板，如您电脑上的版本无法运行或者运行报错，请到CTEX下载中心[下载](http://www.ctex.org/CTeXDownload/)2.92.164稳定版本，如您对手动安装package不太熟悉，建议安装完整版本的。
此外，如您在其它版本的CTEX可以正常运行该模板，欢迎告知（sslchi@126.com）。

# 常见错误及解决方法
1. 中文显示乱码， 检查编码方式需要设置为utf8.
2. 没有所需字体， 下载字体。
3. Ubuntu 下报错The font "[SIMKAI.TTF]" cannot be found {SimSun}.
   双击报错信息，打开ctex-xecjk-winfonts.def, 将里面的部分内容替换：[SIMKAI.TTF] ---> KaiTi, [SIMFNAG.TTF]---> FangSong, 注意方括号。
 
