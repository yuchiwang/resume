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
    - 模型优化：低精度量化、稀疏、剪枝、投机推理、PD 分离。
    - 算子与性能：GEMM/SFU 精度分析、CUDA kernel 调试、SIMD 算子开发。
    - 编译与工具链：MLIR、图优化、PyTorch、C/C++、Python。
  ]

  let work-experience = {
    cventry(
      tl: [*海光信息*，战略与架构部，上海],
      tr: [#translate-date(5, 2026) -- 至今],
      bl: [主管工程师，推理仿真],
    )[
      - 跟踪大模型推理最新模型结构、负载特征和推理优化技术，分析系统架构需求，与DCU芯片/网络芯片团队深度协助，进行软硬件协同设计。
      - 面向大规模推理集群和超节点系统，开发 SGLang Simulator 进行推理系统建模与仿真，评估KV cache offloading、并行策略和多机通信等关键路径。
      - 为计算、存储、Scale-Up/Scale-Out 高速互联和网络架构提供容量规划、带宽需求和系统瓶颈分析参考。
    ]

    cventry(
      tl: [*东阳光*，算力事业部，上海],
      tr: [#translate-date(1, 2025) -- #translate-date(4, 2026)],
      bl: [架构师，LLM Serving],
    )[
      - 负责 Token factory 推理系统架构设计、推理服务优化和国产算力适配。
      - 开发智算 IDC 运维 agent，支撑节点状态采集、任务执行、故障定位和自动化运维流程。
    ]

    cventry(
      tl: [*沐曦集成电路*，PDE，上海],
      tr: [#translate-date(8, 2024) -- #translate-date(11, 2025)],
      bl: [软件专家，推理框架适配],
    )[
      - 负责 vLLM 多版本在沐曦 GPU 上的适配、问题定位和性能优化。
      - 基于 SGLang 完成 DeepSeek V3/R1 部署方案实践，采用 PD 分离部署并适配 DP、EP、TP 并行策略，参与调度、KV cache、通信链路和吞吐/时延分析。
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
    ]

    cventry(
      tl: [*百度*，IDG，上海],
      tr: [#translate-date(7, 2021) -- #translate-date(8, 2022)],
      bl: [高级研发工程师，模型部署],
    )[
      - 负责智能座舱语音语义模型部署，将模型通过 Paddle Lite 部署至高通座舱芯片。
      - 参与模型端侧化链路优化，包括模型转换、算子支持确认、运行时集成、性能 profiling 和内存占用分析。
      - 针对座舱场景的实时性和资源约束，配合算法侧完成模型裁剪、量化验证和端上效果回归。
    ]

    cventry(
      tl: [*阿里巴巴*，平头哥，上海],
      tr: [#translate-date(4, 2018) -- #translate-date(6, 2021)],
      bl: [开发工程师，端侧推理],
    )[
      - 面向天猫精灵智能音箱，开发 MCU 级芯片上的超轻量级语音唤醒引擎；参考 Caffe 和 TFLite，采用纯 C 编写，使用 SIMD 汇编加速算子， 8 比特量化。
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
