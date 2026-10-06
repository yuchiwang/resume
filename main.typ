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

  let summary = [
    - *7 年+ AI 芯片推理框架适配经验*，参与多款云端/端侧 AI 芯片的推理框架适配、性能优化与模型部署。
    - 熟悉大模型推理框架 vLLM、SGLang、LMDeploy，以及 ONNXRuntime、TFLite、Paddle Lite 等小模型推理框架。
    - 熟悉模型量化、稀疏、剪枝等轻量化方法，理解 AI 编译流程，具备 MLIR 前端 IR 设计和图优化开发经验。
    - 了解 CUDA 编程、芯片算子精度分析、低精度浮点数值表示与 rounding mode，熟悉 C/C++ 和 Python。
  ]

  let work-experience = {
    cventry(
      tl: [*沐曦集成电路*，PDE，上海],
      tr: [#translate-date(8, 2024) -- #translate-date(11, 2025)],
      bl: [软件专家，推理框架适配],
    )[
      - 负责 vLLM 多版本适配；基于 SGLang 完成 DeepSeek V3/R1 在沐曦 GPU 上的部署方案实践，采用 PD 分离部署并适配 DP、EP、TP 并行策略。
      - 在模型侧采用 int8 动态量化；算子侧采用 MLA 矩阵吸收、算子融合、通信与计算掩盖等技术，提升硬件算力、访存与通信带宽利用率；结合投机推理 MTP 优化系统整体性能。
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
    ]

    cventry(
      tl: [*百度*，IDG，上海],
      tr: [#translate-date(7, 2021) -- #translate-date(8, 2022)],
      bl: [高级研发工程师，模型部署],
    )[
      - 负责智能座舱模型部署，将百度语音语义模型通过 Paddle Lite 推理引擎部署至高通 SA8295P 座舱芯片。
    ]

    cventry(
      tl: [*阿里巴巴*，平头哥，上海],
      tr: [#translate-date(4, 2018) -- #translate-date(6, 2021)],
      bl: [开发工程师，推理框架],
    )[
      - 面向天猫精灵智能音箱，开发 MCU 级芯片上的超轻量级语音唤醒引擎；参考 Caffe 和 TFLite，采用纯 C 编写，使用 SIMD 汇编加速算子，模型采用 8 比特量化。
      - 开发内存规划器，通过张量生命周期分析与内存复用，降低模型推理峰值内存占用。
      - 编写 SIMD 神经网络算子库和数学库。
    ]

    cventry(
      tl: [*华为*，无线，上海],
      tr: [#translate-date(5, 2014) -- #translate-date(10, 2016)],
      bl: [助理工程师，C/C++],
    )[
      - 负责 LTE 基站上行调度器开发。
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

  == 个人概要
  #summary

  == 工作经历
  #work-experience

  == 教育经历
  #education

  == 其它
  #misc
  ]
}
