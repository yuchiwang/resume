#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let edu = {
    let psu-courses = (
      ([Math 435], [Abstract Algebra], [抽象代数]),
      ([Cmpsc 450], [Concurrent Programming], [并发科学编程]),
      ([Math 427], [Foundations of Geometry], [几何基础]),
      ([Math 429], [Introduction to Topology], [拓扑学入门]),
      ([Math 437], [Algebraic Geometry], [代数几何]),
    )
    translate(en: [== Education], zh: [== 教育经历])
    let gpa = 3.28
    let psu-date = [#translate-date(9, 2011) -- #translate-date(4, 2014)]
    translate(
      en: cventry(
        tl: [B.S. in Computer Science at *The Pennsylvania State University*, PA, US],
        tr: psu-date,
      )[Minor in Mathematics, GPA #gpa/4.00#noSimple(simple: [,
        selected courses: #psu-courses.map(item => item.at(0)).join(", ")])[\
        Selected courses: #psu-courses.map(item => item.at(0) + " " + item.at(1)).join(", ")]],
      zh: cventry(
        tl: [上海大学，机械电子工程，硕士],
        tr: psu-date,
      )[],
    )

    let cmu-courses = (
      ([15-836], [Substructural Logics], [亚结构逻辑]),
      ([15-791], [Advanced Topics in Foundations of Types and Programming Languages], [类型和编程语言基础中的高级课题])
    )
    let cmu-date = [#translate-date(9, 2007) -- #translate-date(6, 2011)]
    translate(
      en: cventry(
        tl: [Ph.D. in Computer Science at *Carnegie Mellon University*, PA, US],
        tr: cmu-date,
      )[Advisor: Stephanie Balzer#noSimple(simple: [,
        selected courses: #cmu-courses.map(item => item.at(0)).join(", ")])[\
        Selected courses: #cmu-courses.map(item => item.at(0) + " " + item.at(1)).join(", ")]],
      zh: cventry(
        tl: [浙江科技大学，机械设计制造机器自动化，本科],
        tr: cmu-date,
      )[],
    )
  }

  let sbrella = {
    let sbrella-date = [#translate-date(2, 2018) -- #translate-date(7, 2018)]
    translate(
      en: cventry(
        tl: [*Sourcebrella Inc.*, Shenzhen, China],
        tr: sbrella-date,
        bl: [_Static Analysis_, Compiler Frontend, IDE Plugin Development],
      )[#noSimple[
      - Created IntelliJ/CLion/Eclipse plugin for the Pinpoint analyzer. Co-worked on the SonarQube plugin.
      - Created a multi-threading cross Java/Kotlin source code indexer which can index Hadoop within 4 minutes.
      - Learned a lot about Linux programming and the Clang/LLVM codebase.
      ]],
      zh: cventry(
        tl: [*深圳市前海源伞科技有限公司*，深圳，中国],
        tr: sbrella-date,
        bl: [静态分析，编译器前端，IDE 插件开发实习],
      )[#noSimple[
      - 负责 pinpoint 分析器的 IntelliJ/CLion/Eclipse 工具集成，协助开发 SonarQube 插件。
      - 编写了一个多线程的跨 Java/Kotlin 的源代码索引工具，索引 Hadoop 源码仅需 4 分钟。
      - 学到了很多 Linux 编程和 Clang/LLVM 源码相关的知识。
      ]],
    )
  }

  let pingcap = {
    let grpcio = link("https://docs.rs/crate/grpcio", "grpcio")
    let procinfo = link("https://docs.rs/crate/procinfo", "procinfo")
    let protobuf = "Protocol-Buffer"
    let pingcap-date = [#translate-date(8, 2018) -- #translate-date(8, 2019)]
    translate(
      en: cventry(
        tl: [*PingCAP Inc.*, Remote],
        tr: pingcap-date,
        bl: [_Distributed Storage Systems_, TiKV Intern -- Ecosystem Team],
      )[#noSimple[
      - Improved many TiKV-relevant libraries, like optimizing the performance of #grpcio, adding new features to #procinfo.
      - Helped to migrate the #protobuf library used by TiKV and its Raft implementation.
      - Learned a lot about Rust programming, distributed system, working remotely, and databases.
      ]],
      zh: cventry(
        tl: [*北京平凯星辰科技发展有限公司*，远程],
        tr: pingcap-date,
        bl: [分布式存储系统，TiKV 实习 -- Ecosystem 小组],
      )[#noSimple[
      - 改进各种 TiKV 的外部依赖库，如优化 #grpcio 的内存性能，改善 #procinfo 的功能。
      - 协助迁移 TiKV 及其 Raft 实现所使用的 #protobuf 库。
      - 学到了很多 Rust 编程、分布式系统、远程工作和数据库相关的知识。
      ]],
    )
  }

  let jetbrains = {
    let jetbrains-date = [#translate-date(8, 2024) -- #translate-date(11, 2025)]
    translate(
      en: cventry(
        tl: [*JetBrains Research*, Remote],
        tr: jetbrains-date,
        bl: [_HoTT and Dependent Types_, Interactive Theorem Prover Development],
      )[
      #noSimple[- Used features like gradle composite build and buildSrc to reduce build time and improve automation.]
      - Improved the language/IDE, such as sections, hygiene macros, `Fin` type with elaborative subtyping, semantic highlighting, etc.
      #noSimple(
        simple: [- Created a debugger for inspecting bidirectional type-checking and REPL in both CLI and IntelliJ IDEA.]
      )[
        - Created an extensible REPL engine, provided implementations in CLI (with contextual completion using `jline3`) and in IntelliJ IDEA (interacts with the opened project, supports completion, highlighting and goto definition).
        - Designed and implemented an expression type-checking debugger that supports step-into and displays local context and expressions as stack frames.
      ]],
      zh: cventry(
        tl: [*沐曦集成电路*，PDE, 上海],
        tr: jetbrains-date,
        bl: [大模型推理，软件专家],
      )[
      - vLLM各版本适配。
      - sglang分布式推理系统架构设计和优化，从调度、访存、通信等各个层面分析和优化推理性能。
      - lmdeploy适配和性能优化。
      ],
    )
  }

  let plct = {
    let aya-date = [#translate-date(9, 2022) -- #translate-date(5, 2024)]
    let ntypeCafe = "https://infinity-type-cafe.github.io/ntype-cafe-summer-school"
    translate(
      en: cventry(
        tl: [*PLCT Lab*, Remote],
        tr: aya-date,
        bl: [_Implementation of Dependent Types_, Opensource Maintainer],
      )[#noSimple(
        // simple: [- Leading a team to explore modern techniques in type theory implementation.]
      )[
      - Leading a team to explore modern techniques in type theory implementation, such as pattern unification, elimination of dependent pattern matching, Cartesian cubical type theory, termination check of recursive functions, phase distinction between layers of a type theory, etc.
      - Organized reading activities on design and implementation of type theory, presented several talks in #link(ntypeCafe)[∞-Type Café Summer School on Type Theory] (in Chinese).
      ]],
      zh: cventry(
        tl: [*理想汽车*，算力单元，上海],
        tr: aya-date,
        bl: [AI编译器， 高级开发工程师],
      )[
      - AI编译器前端表示与图优化。
      - 算子精度验证框架开发。
      ],
    )
  }

  let risingwave = {
    let risingwave-date = [#translate-date(7, 2021) -- #translate-date(8, 2022)]
    translate(
      en: cventry(
        tl: [*RisingWave Labs*, Remote],
        tr: risingwave-date,
        bl: [_Streaming Database_, Developer Intern],
      )[
      #noSimple[- Proposed an overhaul of the query plan AST design, which better facilitates the enum feature implemented in the Rust language.]
      - Implemented a pretty printing framework for trees with smart line fitting and Unicode art. Integrated into SQL explain.
      ],
      zh: cventry(
        tl: [*百度*，IDG，上海],
        tr: risingwave-date,
        bl: [模型部署，高级研发工程师],
      )[
      - 智能座舱模型部署。
      ],
    )
  }

  let mcREU = {
    let reu-date = [#translate-date(4, 2018) -- #translate-date(6, 2021)]
    let ghLink = githublink("owo-lang/voile-rs")
    translate(
      en: cventry(
        tl: [*Multi-Campus REU*, State College],
        tr: reu-date,
      )[
      - Extensively studied the literature on row polymorphism and record calculus.
      - Implemented (#ghLink) and formalized a row polymorphic dependent type theory.
      ],
      zh: cventry(
        tl: [*阿里巴巴*，平头哥，上海],
        tr: reu-date,
        bl: [推理框架，开发工程师],
      )[- iot芯片语音唤醒引擎开发。
        - 算子库开发。],
    )
  }

  let la461 = {
    let la461-date = [#translate-date(5, 2014) -- #translate-date(10, 2016)]
    translate(
      en: cventry(
        tl: [*Learning Assistant* for Cmpsc 461 (Programming Language Concepts), State College],
        tr: la461-date,
      )[],
      zh: cventry(
        tl: [*华为*，无线，上海],
        tr: la461-date,
        bl: [C/C++，助理工程师],
      )[- LTE基站上行调度器开发。],
    )
  }

  let aya = {
    translate(
      en: cventry(
        tl: [*Aya Prover*, Practical Implementation of Dependent Types (role: project leader)],
        tr: githublink("aya-prover/aya-dev"),
      )[
      - Supports dependent types, dependent pattern matching with confluence check for overlapping clauses, higher inductive types, GADTs (paper published), hierarchial universes, cubical type theory features, and implicit arguments.
      - Can export elaboration result to HTML or #latex. Can JIT-compile closures into JVM using HOAS, Can refine patterns using coverage information. Supports both LSP in VSCode and IntelliJ PSI. Provide jlink binary releases.
      ],
      zh: cventry(
        tl: [*大模型推理框架沐曦GPU适配*],
        tr: "",
      )[
      - 沐曦GPU上DeepSeek V3/R1 部署方案最佳实践：采用 PD 分离部署的方式。在框架侧，以sglang为基础，针对 DP、EP和TP并行策略做了相应适配，在模型侧，采用int8动态量化策略，在算子侧，采用MLA矩阵吸收、算子融合、通信和计算相互掩盖等技术以最大化利用硬件的算力、访存和通信带宽，使用投机推理MTP， 实现整个系统的最优性能。
      - LMDeploy适配: 同上海人工智能实验室deeplink团队合作，使用dlinfer完成lmdeploy对沐曦GPU的适配，将框架与算子在适配工程中有效解耦，支持LLM和VLM推理。
      ],
    )
  }

  let arendVSCode = {
    translate(
      en: cventry(
        tl: [*VSCode extension for Arend*, Arend language server, based on lsp4j and Arend compiler's internals],
        tr: githublink("ice1000/vscode-arend"),
      )[],
      zh: cventry(
        tl: [*理想汽车自研推理芯片工具链开发*],
        tr: "",
      )[
      - 负责基于MLIR的AI编译器前端IR设计，支持ONNX等模型导入；算子融合等图优化pass编写。
      - 负责GEMM、SFU等算子精度分析，基于pytorch构建算子精度验证框架，精度差异定位，评估不同量化策略和浮点低精度数值表示（fp8/fp24）在智驾模型上的精度表现。
      ],
    )
  }

  let arendIO = {
    translate(
      en: cventry(
        tl: [*Arend IO*, Experimental IO library for Arend, implements unsafePerformIO and simple IO actions],
        tr: githublink("ice1000/arend-io"),
      )[],
      zh: cventry(
        tl: [*百度智能座舱*，将百度语音语义模型通过Paddle Lite推理引擎部署至高通SA8295P座舱芯片。],
        tr: "",
      )[],
    )
  }

  let intellijPest = {
    translate(
      en: cventry(
        tl: [*IntelliJ Pest*, Pest language plugin for IntelliJ Platform],
        tr: githublink("pest-parser/intellij-pest"),
      )[
      - Semantic-based highlighting, completion, navigation, definition extraction/inlining, and Rust plugin integration.
      - Provides live preview -- test grammar files by dynamically highlighting user code according to the grammar on the fly. These highlighted code could be exported to HTML.
      ],
      zh: cventry(
        tl: [*嵌入式场景推理唤醒引擎开发*],
        tr: ""
      )[
      对天猫精灵智能音箱产品，开发面向MCU级芯片的超轻量级语音唤醒引擎，参考caffe和tflite，采用纯C编写，使用simd汇编对算子进行加速，模型采用8比特量化。
      - 内存规划器开发，通过张量生命周期分析与内存复用，最小化模型推理时的峰值内存占用。
      - SIMD算子库编写：神经网络算子和数学库。

      ],
    )
  }

    let summary = {
    let progLang = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- *7年+AI芯片推理框架适配经验*，熟悉推理引擎关键技术，参与多款云/端 AI 芯片的 AI 推理框架适配与性能优化。]
      )
    }

    let kotlinJava = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 熟悉*大模型推理框架*（vLLM/sglang），有实际开发经验。]
      )
    }

    let compiler = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 熟悉*小模型推理框架*整体架构（ONNXRuntime/TFLite）。]
      )
    }

    let typeTheory = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 熟悉*模型量化，稀疏，剪枝*等轻量化方法。]
      )
    }

    let ideDev = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 理解*AI编译*流程，熟悉*MLIR*，具备相关开发经验。]
      )
    }

    let mobileDev = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 对*CUDA编程*有一定了解，有实际调试、优化经验。]
      )
    }

    let devTools = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 对芯片算子精度分析有一定了解，熟悉*低精度*浮点数值表示，rounding mode等。]
      )
    }

    let language = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 熟悉C/C++和python。]
      )
    }

    progLang 
    kotlinJava
    compiler
    typeTheory
    ideDev
    mobileDev
    devTools
    language
  }

  let skills = {
    let devTools = {
      let tools = ("YouTrack", "Jira", "GitHub", "BitBucket", /* "Coding.net", "Tower", */ "Slack", "JetBrains Space")
      translate(en: [
        - Tools: editor-agnostic, have experience with team tools like #tools.join(", ") and more.
      ], zh: [- 开发工具：能适应任何常见编辑器/操作系统，有使用 #tools.join("、") 等团队协作工具的经验。])
    }
    let compiler = translate(en: [
      - Compiler: understand techniques like locally nameless, explicit substitution, ANF, (P)HOAS (in LF & logic programming), and NbE.
        #noSimple[Familiar with most parser generators, understand layout syntax parsing.]
    ], zh: [
      - 编译器：理解局部无名表示法、惰性代换（ES）、ANF、(P)HOAS 等技术，理解语义正规化（NbE）及其使用的惰性闭包技术。熟悉大部分 parser 生成器，理解布局的语法解析。
    ])
    let progLang = {
      let very = "Java Kotlin Rust C# Agda Haskell Arend"
      let somehow = "Dart C C++ F# F★ Idris Perl MATLAB"
      translate(en: [
        - Programming Languages: multilingual (not limited to any specific language), especially experienced in #very, comfortable with #somehow (in random order).
      ], zh: [
        - 编程语言：泛语言（编程不受特定语言限制），且尤其熟悉 #very，较为熟悉 #somehow（排名均不分先后）。
      ])
    }
    let ideDev = {
      let pref = "https://plugins.jetbrains.com/plugin/"
      let julia = link(pref + "10413")[Julia]
      let dtlc  = link(pref + "12176")[DTLC]
      let pest  = link(pref + "12046")[Pest]
      let kala  = link(pref + "17453")[Kala Inspections]
      translate(en: [
        - IDE Tooling: *6 years of experience*, familiar with the IntelliJ Platform infrastructure (created #julia, #dtlc, #pest, #kala, etc.), also have experience with VSCode plugin development.
      ], zh: [
        - IDE 工具开发：*6 年开发经验*，熟悉 IntelliJ 平台的基础设施（开发了 #julia、#dtlc、#pest、#kala 等插件），同时了解 VSCode 的插件开发。
      ])
    }
    let kotlinJava = {
      let before-swing = "JNI, JPMS, Gradle, Kotlin coroutines"
      translate(
        en: [- Kotlin/Java: *10 years of experience*, familiar with #before-swing, and Swing.],
        zh: [- Kotlin/Java：*10 年开发经验*，熟悉 #before-swing, Swing。]
      )
    }
    let mobileDev = translate(
      en: [- Mobile Development: *2 years of experience*, familiar with Flutter and Android.],
      zh: [- 移动端开发：*2 年开发经验*，熟悉 Flutter、Android。]
    )
    let typeTheory = translate(
      en: [- Type Theory: understand Martin-Löf type theory, coinduction, HoTT, and Cubical, familiar with Idris, Agda (*5 years* of experience, contributor), Arend and some Lean/F★/Coq.],
      zh: [- 类型论：理解 Martin-Löf 类型论、余归纳法、同伦类型论、立方类型论；熟悉 Idris，Agda（*5 年经验*，编译器和标准库贡献者），Arend 和一些 Lean/F★/Coq。]
    )
    progLang
    compiler
    kotlinJava
    typeTheory
    noSimple[
      - *JetBrains MPS*: #translate(
        en: [understand concepts and applications of #link("https://www.jetbrains.com/mps/")[Language-Oriented Programming].],
        zh: [理解 #link("https://www.jetbrains.com/mps/")[面向语言编程] 的概念和应用。]
      )
    ]
    ideDev
    noSimple[#mobileDev]
    devTools
  }

  let misc = {
    let intellij = "https://plugins.jetbrains.com/author/10a216dd-c558-4aaf-aa8a-723f431452fb"
    let osc      = link("https://ice1000.org/opensource-contributions")
    // bintray  = "https://bintray.com/ice1000"
    let crates   = "https://crates.io/users/ice1000"
    // What to do with this?
    // let personal = "https://personal.psu.edu/yqz5714"
    let seRep    = [6000+]
    let paRep    = [5000+]
    let stackex(e) = link("https://stackexchange.com/users/9532102")[#e]
    let pase     = link("https://proofassistants.stackexchange.com/users/32/ice1000")[Proof Assistants]
    // https://raw.githubusercontent.com/ice1000/resume/master/resume.pdf
    let enSimple = link("https://tinyurl.com/y8xdlfug")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-elab.pdf
    let enElab   = link("https://tinyurl.com/y2v59t36")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-cn.pdf
    let cnLink   = link("https://tinyurl.com/ya4urea8")
    let codewars = link("https://www.codewars.com/users/ice1000")[CodeWars]
    let cwLevel  = [*1 dan*]
    let cwPerc   = [0.020%]
    let cwRank   = [\#111]
    let projects = [*agda, Arend, libgdx, jacoco, KaTeX, shields.io, grpc-rs, intellij-solidity, intellij-haskell, intellij-rust, TeXiFy-IDEA, rust-analyzer*]
    let GPTQModel = link("https://github.com/ModelCloud/GPTQModel")[GPTQModel]
    let dlinfer = link("https://github.com/DeepLink-org/dlinfer")[dlinfer]
    let lmdeploy = link("https://github.com/InternLM/lmdeploy")[lmdeploy]

    translate(
      en: [
        - Open-source contributions: #osc, #noSimple[member of JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang and more,]
          contributed to #projects and other projects #noSimple[(apart from organization ones)]
      ],
      zh: [- 开源贡献: 向 #GPTQModel, #dlinfer, #lmdeploy 等项目贡献过代码]
    )

    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- 语言：English - 大学6级]
    )
  }

  // Start of the document

  translate(en: [= #smallcaps[Tesla Zhang]], zh: [= 王宇驰])

  [#link("mailto:yuchiwang@163.com")[yuchiwang\@163.com] $dot.c$ #iconlink("13917833446") $dot.c$ #iconlink("https://github.com/yuchiwang", icon: "github")]

  translate(en: [== Personal Summary], zh: [== 个人概要])
  summary


  translate(en: [== Work Experience], zh: [== 工作经历])
  jetbrains
  plct
  risingwave
  mcREU
  la461

  translate(en: [== Related Projects], zh: [== 项目经历])
  aya
  noSimple[
    #arendVSCode
    #arendIO
  ]
  intellijPest

  // noSimple[
  //   #translate(en: [== Academic Experience], zh: [== 学术经历])
  //   #mcREU
  //   #la461
  // ]

  // translate(en: [== Skills], zh: [== 技能])
  // skills


  edu

  translate(en: [== Misc], zh: [== 其它])
  misc

  // // https://github.com/typst/typst/issues/1462
  // {
  //   set text(size: 0pt)
  //   [@SIT]
  //   noSimple[@ExactlyApplied, @Guest, @ExtTyApp, @FordHelix]
  // }
  // translate(en: [== Publications & Preprints], zh: [== 论文发表 & 预印本])
  // bibliography("pub.bib", title: none)
}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
