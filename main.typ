#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2

#let runReader(mode) = {
  let translate-date(month, year) = [#year 年 #month 月]

  let contact = [
    #link("mailto:yuchiwang@163.com")[yuchiwang\@163.com]
    $dot.c$ 13917833446
    $dot.c$ #link("https://github.com/yuchiwang")[GitHub: yuchiwang]
  ]

  let skills = [
    - 推理框架：vLLM、SGLang、LMDeploy、ONNXRuntime、TFLite、Paddle Lite。
    - 模型优化：int8 动态量化、低精度浮点（fp8/fp24）、稀疏、剪枝、投机推理、PD 分离部署。
    - 算子与性能：GEMM/SFU 精度分析、CUDA kernel 调试、SIMD 算子开发、算子融合、访存优化、通信与计算掩盖。
    - 编译与工具链：MLIR、ONNX 模型导入、图优化 pass、PyTorch 精度验证框架、C/C++、Python。
  ]

  let work-experience = {
    cventry(
      tl: [*沐曦集成电路*，PDE，上海],
      tr: [#translate-date(8, 2024) -- #translate-date(11, 2025)],
      bl: [软件专家，推理框架适配],
    )[
      - 负责 vLLM 多版本在沐曦 GPU 上的适配与问题定位，处理框架 API 变更、算子调用链、显存管理和分布式执行中的兼容性问题。
      - 基于 SGLang 完成 DeepSeek V3/R1 部署方案实践，采用 PD 分离部署并适配 DP、EP、TP 并行策略，参与调度、KV cache、通信链路和吞吐/时延分析。
      - 在模型侧采用 int8 动态量化；算子侧采用 MLA 矩阵吸收、算子融合、通信与计算掩盖等技术，提升硬件算力、访存与通信带宽利用率。
      - 参与 CUDA/GPU 算子适配与性能调优，围绕矩阵乘、attention、量化/反量化、数据搬运等热点路径进行 profiling、瓶颈分析和优化验证。
      - 与上海人工智能实验室 DeepLink 团队合作，使用 dlinfer 完成 LMDeploy 对沐曦 GPU 的适配，将框架与算子适配解耦，支持 LLM 和 VLM 推理。
    ]

    cventry(
      tl: [*理想汽车*，算力单元，上海],
      tr: [#translate-date(9, 2022) -- #translate-date(5, 2024)],
      bl: [高级开发工程师，AI 编译器],
    )[
      - 负责基于 MLIR 的 AI 编译器前端 IR 设计，支持 ONNX 等模型导入；编写算子融合等图优化 pass。
      - 负责 GEMM、SFU 等算子精度分析，基于 PyTorch 构建算子精度验证框架，定位精度差异。
      - 评估不同量化策略和低精度浮点数值表示（fp8/fp24）在智驾模型上的精度表现。
      - 联调编译器、运行时与算子库，分析模型从图表示、算子 lowering 到芯片执行过程中的精度和性能问题。
      - 构建自动化对比流程，支持算子级、子图级与模型级输出校验，提高工具链迭代过程中的回归定位效率。
    ]

    cventry(
      tl: [*百度*，IDG，上海],
      tr: [#translate-date(7, 2021) -- #translate-date(8, 2022)],
      bl: [高级研发工程师，模型部署],
    )[
      - 负责智能座舱语音语义模型部署，将模型通过 Paddle Lite 推理引擎部署至高通 SA8295P 座舱芯片。
      - 参与模型端侧化链路优化，包括模型转换、算子支持确认、运行时集成、性能 profiling 和内存占用分析。
      - 针对座舱场景的实时性和资源约束，配合算法侧完成模型裁剪、量化验证和端上效果回归。
    ]

    cventry(
      tl: [*阿里巴巴*，平头哥，上海],
      tr: [#translate-date(4, 2018) -- #translate-date(6, 2021)],
      bl: [开发工程师，端侧推理],
    )[
      - 面向天猫精灵智能音箱，开发 MCU 级芯片上的超轻量级语音唤醒引擎；参考 Caffe 和 TFLite，采用纯 C 编写，使用 SIMD 汇编加速算子，模型采用 8 比特量化。
      - 开发内存规划器，通过张量生命周期分析与内存复用，降低模型推理峰值内存占用。
      - 编写 SIMD 神经网络算子库和数学库。
      - 负责卷积、全连接、激活、归一化等基础算子的定点化实现与性能优化，在低算力、低内存设备上保障唤醒链路实时运行。
      - 参与推理框架模块设计，包括模型解析、执行计划、tensor 管理、算子调度和平台相关优化接口。
    ]

    cventry(
      tl: [*华为*，无线，上海],
      tr: [#translate-date(5, 2014) -- #translate-date(10, 2016)],
      bl: [助理工程师，无线基站软件],
    )[
      - 负责 LTE 基站上行调度器开发。
      - 使用 C/C++ 参与无线基站软件模块开发，积累通信系统、嵌入式软件和性能敏感型 C/C++ 工程经验。
      - 参与模块问题定位、日志分析和版本维护，熟悉大型工程中的代码评审、联调和交付流程。
    ]
  }

  let education = {
    cventry(
      tl: [上海大学，机械电子工程，硕士],
      tr: [#translate-date(9, 2011) -- #translate-date(4, 2014)],
    )[]

    cventry(
      tl: [浙江科技大学，机械设计制造及其自动化，本科],
      tr: [#translate-date(9, 2007) -- #translate-date(6, 2011)],
    )[]
  }

  let misc = {
    let GPTQModel = link("https://github.com/ModelCloud/GPTQModel")[GPTQModel]
    let dlinfer = link("https://github.com/DeepLink-org/dlinfer")[dlinfer]
    let lmdeploy = link("https://github.com/InternLM/lmdeploy")[lmdeploy]

    [
      - 开源贡献：向 #GPTQModel、#dlinfer、#lmdeploy 等项目贡献过代码。
      - 语言能力：英语六级。
    ]
  }

  [
  = 王宇驰
  #contact

  == 技能专长
  #skills

  == 工作经历
  #work-experience

  == 教育经历
  #education

  == 其它
  #misc
  ]
}
