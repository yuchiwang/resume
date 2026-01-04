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
    let gpa = 3.85
    let psu-date = [#translate-date(9, 2010) -- #translate-date(6, 2014)]
    translate(
      en: cventry(
        tl: [B.S. in Computer Science at *The Pennsylvania State University*, PA, US],
        tr: psu-date,
      )[Minor in Mathematics, GPA #gpa/4.00#noSimple(simple: [,
        selected courses: #psu-courses.map(item => item.at(0)).join(", ")])[\
        Selected courses: #psu-courses.map(item => item.at(0) + " " + item.at(1)).join(", ")]],
      zh: cventry(
        tl: [重庆大学，电子信息工程，本科],
        tr: psu-date,
      )[GPA #gpa/4.00],
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
    let jetbrains-date = [#translate-date(7, 2022) -- #translate-date(7, 2025)]
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
        tl: [*上汽集团财务有限公司*，上海],
        tr: jetbrains-date,
        bl: [运营 / 系统负责人],
      )[
      - 负责自营及投顾账户运营：投前配置、投中交易、投后持仓与估值核对，覆盖 SAP / 赢时胜系统。
      - 牵头投融资板块监管报送：人行金数、利率日报、EAST、1104、新资本等，保障报送质量与合规。
      - 负责监管报表自动化：完成数据源梳理、接口落地、报表自动生成，降低人工成本。
      - 推动固收交易系统改造：实现交易、风控、估值、报表全流程线上化。
      - 协调外汇交易中心、券商、资讯商等多方接口，提升数据治理与业务效率。
      ],
    )
  }

  let plct = {
    let aya-date = [#translate-date(1, 2022) -- #translate-date(6, 2022)]
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
        tl: [*兴业证券股份有限公司*，上海],
        tr: aya-date,
        bl: [运维工程师],
      )[
      - 负责估值系统、TA/直销 TA 系统运维与部署。
      - 参与两地三中心机房搬迁，完成测试与实施协同。
      ],
    )
  }

  let risingwave = {
    let risingwave-date = [#translate-date(4, 2020) -- #translate-date(12, 2022)]
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
        tl: [*赢时胜股份有限公司*，上海],
        tr: risingwave-date,
        bl: [需求工程师],
      )[
      - 负责银行托管清算与估值系统需求分析、方案设计与落地。
      - 负责 IFRS9 会计准则切换项目（社保产品），保障准时平稳上线。
      - 维护托管行每日对账、清算、估值核算流程。
      ],
    )
  }

  let sbrella = {
    let sbrella-date = [#translate-date(8, 2014) -- #translate-date(3, 2020)]
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
        tl: [*恒生电子股份有限公司*， 上海],
        tr: sbrella-date,
        bl: [估值实施],
      )[#noSimple[
      - 负责估值系统部署、数据迁移、交易/行情/TA 对接与核算支持。
      - 服务证券、信托、资管客户：齐鲁资管、浙商证券、中航信托等。
      - 参与多家机构公募资质厂检，并承担客户培训与售前支持。
      ]],
    )
  }

  let la461 = {
    let la461-date = [#translate-date(8, 2022) -- #translate-date(12, 2022)]
    translate(
      en: cventry(
        tl: [*Learning Assistant* for Cmpsc 461 (Programming Language Concepts), State College],
        tr: la461-date,
      )[],
      zh: cventry(
        tl: [*Cmpsc 461 课程助教*（课程标题：编程语言概念），州学院],
        tr: la461-date,
      )[],
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
        tl: [*监管报表自动化项目*，上汽集团财务有限公司],
        tr: "负责人"
      )[
      - 覆盖人行利率日报、金数、EAST、1104、新资本基金穿透等核心监管报表。
      - 完成监管口径梳理、数据源治理、需求文档与方案设计，推动系统自动生成与校验。
      - 对接外汇交易中心、券商、资讯商接口（CSTP、RDI、行情数据），显著降低人工填报与差错率。
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
        tl: [*IFRS9 会计准则切换项目*，赢时胜股份有限公司],
        tr: "负责人",
      )[
      - 负责社保产品 IFRS9 准则切换需求分析与系统方案设计。
      - 覆盖 SPPI 数据处理、核算模板调整及并行验证，保障准则切换平稳上线。
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
        tl: [*浙商汇金信托一体化项目*，恒生电子股份有限公司],
        tr: "估值系统实施负责人",
      )[
      - 负责恒生 PB / TCMP / TA / 资管系统 的系统集成、数据迁移与联测。
      - 完成约 150 个存量产品 的数据迁移及二级市场业务联调。
      ],
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
        tl: [*固收投资交易系统改造项目*，上汽集团财务有限公司],
        tr: "负责人"
      )[
      - 主导固收投前–投中–投后全流程线上化，落地赢时胜交易、风控、估值、报表模块。
      - 实现交易数据与行情数据自动获取，替代 SAP 手工录入与制表。
      - 支持风控额度校验、持仓监控及监管报表自动生成。
      ],
    )
  }

  let summary = {
    let progLang = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- *10+ 年金融系统 / 资管业务经验*，覆盖证券、基金、信托、银行及财务公司。]
      )
    }

    let kotlinJava = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 具备*估值、交易、TA 及监管报表*等核心系统从需求梳理到落地实施的实际经验。]
      )
    }

    let compiler = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- *监管报送 & 数据治理*专家：熟悉人行金数、利率日报、EAST、1104、新资本基金穿透等 50+ 报表。]
      )
    }

    let typeTheory = {
      translate(
        en: [- Kotlin/Java: *10 years of experience*.],
        zh: [- 兼具*业务 + IT/系统*能力，可高效连接*业务、风控、财务与技术*团队。]
      )
    }

    progLang 
    kotlinJava
    compiler
    typeTheory
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

    let myskills = {
    let compiler = translate(en: [
      - Compiler: understand techniques like locally nameless, explicit substitution, ANF, (P)HOAS (in LF & logic programming), and NbE.
        #noSimple[Familiar with most parser generators, understand layout syntax parsing.]
    ], zh: [
      - 监管与报表：人行金数、利率日报、EAST、1104、新资本基金穿透。
    ])
    let progLang = {
      let very = "Java Kotlin Rust C# Agda Haskell Arend"
      let somehow = "Dart C C++ F# F★ Idris Perl MATLAB"
      translate(en: [
        - Programming Languages: multilingual (not limited to any specific language), especially experienced in #very, comfortable with #somehow (in random order).
      ], zh: [
        - 系统：赢时胜交易/估值/报表、恒生估值/TA、SAP。
      ])
    }
    progLang
    compiler
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

    translate(en: noSimple(simple: [
      - Profile links (please use a PDF reader with hyperlink support):
        #link(crates)[Crates.io],
        #link(intellij)[IntelliJ] Marketplace
    ])[
      - Crates.io: #link(crates), publishing interesting Rust libraries
      - IntelliJ Marketplace: #link(intellij)
    ], zh: [
      - 相关个人页面链接（请使用支持超链接的 PDF 阅读器）：#link(crates)[Crates.io] 主页，#link(intellij)[IntelliJ] 插件市场主页
    ])
    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- 语言：English - 熟练 (托福 100)，汉语 - 母语水平]
    )
    translate(
      en: [
        - Open-source contributions: #osc, #noSimple[member of JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang and more,]
          contributed to #projects and other projects #noSimple[(apart from organization ones)]
      ],
      zh: [- 开源贡献: #osc，向 #projects 等项目贡献过代码]
    )
    [- #link("https://stackoverflow.com/users/7083401/ice1000")[StackOverflow]: #seRep
      #translate(
        en: [reputation, also active on #pase (#paRep reputation) and #stackex("other StackExchange sites")],
        zh: [声誉，同时也在 #pase（#paRep 声誉）和#stackex("其他 StackExchange 子站")活跃]
      )
    ]
    translate(
      en: [
        - Latest revision of this resume: one-page version #enSimple, complete version: #enElab
        #noSimple[- Get the Chinese version of this resume: #cnLink]
      ],
      zh: [- 获取此简历的最新更新：中文版本 #cnLink，英语版本 #enElab，单页版本（仅英语）：#enSimple]
    )
    translate(
      en: [
        - #cwLevel on #codewars, ranked #cwRank on the whole site (Top #cwPerc),
          #noSimple[solving and making new coding challenges] primarily in Haskell, Agda, and Idris
          #noSimple[and some other JVM languages]
      ],
      zh: [- 在 #codewars 上，以 Haskell、Agda 和 Idris 为主，达到 #cwLevel，全站排名 #cwRank（前 #cwPerc）]
    )
  }

  let certificate = {
    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- 基金从业资格证]
    )

    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- 证券从业资格证]
    )

    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- CFA 一级]
    )
  
  }

  // Start of the document

  translate(en: [= #smallcaps[Tesla Zhang]], zh: [= #smallcaps[张梦惠]])

  [#link("mailto:zhangmh789@foxmail.com")[zhangmh789\@foxmail.com] $dot.c$ #iconlink("156‑1832‑9897")]

  
  translate(en: [== Personal Summary], zh: [== 个人概要])
  summary


  translate(en: [== Work Experience], zh: [== 工作经历])
  jetbrains
  plct
  risingwave
  sbrella

  translate(en: [== Related Projects], zh: [== 项目经历])
  aya
  intellijPest
  noSimple[
    #arendVSCode
    #arendIO
  ]

  edu

  //noSimple[
  //  #translate(en: [== Academic Experience], zh: [== 学术经历])
  //  #mcREU
  //  #la461
  //]

  translate(en: [== Skills], zh: [== 技能])
  myskills

  //translate(en: [== Misc], zh: [== 其它])
  //misc

  translate(en: [== Certificate], zh: [== 证书])
  certificate

  // https://github.com/typst/typst/issues/1462
  //{
  //  set text(size: 0pt)
  //  [@SIT]
  //  noSimple[@ExactlyApplied, @Guest, @ExtTyApp, @FordHelix]
  //}
  //translate(en: [== Publications & Preprints], zh: [== 论文发表 & 预印本])
  //bibliography("pub.bib", title: none)
}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
