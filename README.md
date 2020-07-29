## mips-cpu-logisim
Logisim实现的五级流水线MIPS CPU

参考自 [华中科技大学MOOC-计算机硬件系统设计](https://www.icourse163.org/course/HUST-1205809816)

## 指令集
实现MIPS指令集子集(24条指令)：

- R型移位指令：sll、sra、srl
- R型算数指令：add、addu、sub
- R型逻辑运算指令：and、or、nor
- R型比较指令：slt、sltu
- R型分支指令：jr
- R型系统调用：syscall
	> if $v0 = 34   数码管显示$a0值
	> 
	> else  暂停  等待Go按钮按下


- I型分支指令：beq、bne
- I型立即数运算指令：addi、addiu、slti、andi、ori
- I型访存指令：lw、sw
- J型分支指令：j、jal


## 运行
- 使用logisim-2.7.1cn.jar或logisim-ita-cn-1204.exe
- 打开相应.circ文件
- 指令存储器加载测试数据镜像（test目录下)
- ctrl-k运行

## 运行示例
运行递归斐波拉契程序如下所示：

![img](https://whileskies-pic.oss-cn-beijing.aliyuncs.com/20200729145810.gif)

## To-Do
- 中断
- 总线
- IO

