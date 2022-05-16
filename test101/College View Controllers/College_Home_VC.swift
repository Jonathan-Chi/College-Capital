
//
//  College_Home.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit
import MapKit
import SafariServices



class College_Home_VC : UIViewController{
    
    
    //MARK: INDICES
    
    let top_thirty_indices = [493, 360, 515, 367, 114, 978, 190, 743, 36, 333, 211, 590, 482, 769, 835, 867, 466, 517, 247, 51, 153, 48, 120, 401, 709, 931, 86, 535, 377, 54]
    let business = [743, 367, 48, 401, 535, 881, 709, 517, 241, 608]
    let bio = [360, 367, 978, 48, 53, 333, 517, 947, 51, 401]
    let poli_science = [978, 360, 493, 48, 401, 114, 367, 515, 53, 590]
    let engineering = [367, 978, 48, 36, 155, 709, 197, 401, 517, 979]
    let psych =  [978, 48, 360, 51, 401, 114, 197, 367, 493, 419]
    let comp_science = [709, 367, 978, 48, 517, 155, 197, 36, 493, 51]
    let nursing = [743, 590, 947, 153, 401, 608, 535, 749, 634, 661]
    
    
    let business_jobs = ["Marketing manager", "Sales manager", "Personal financial advisor", "Accountant", "Auditor", "Management analyst", "Financial analyst", "Stockbroker", "Financial Manager"]
    
    //MARK: Title UI
    let college_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "College Capital"
        bt.font = UIFont(name:"Georgia-Bold", size: 23)
        bt.textColor = .white
        return bt
    }()
    
    lazy var scroll_view : UIScrollView = {
        let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = true // dismiss the indicator by assigning false
        sc.showsHorizontalScrollIndicator = false
        sc.bounces = true
        sc.translatesAutoresizingMaskIntoConstraints = false
        // sc.frame = view.frame//this is all good, no need for auto layout
        sc.backgroundColor = .black
        
        return sc
    }()
    
    lazy var scroll_content_view : UIView = {
       let v = UIView()
        v.backgroundColor = .black
        return v
    }()
    
    
    
    
    //MARK: Collection Views
    let college_identifier = "college"
    
    
    //MARK: TOP THIRTY
    lazy var top_thirty_CV: UIButton = {
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv
    }()
    
    lazy var top_thirty_image : UIImageView = {
        let image = UIImage(named: "top_thirty")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var top_thirty_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "National University Rankings"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Ranking Nacional de Universidades"
            
        } else if language == .ZH {
            bt.text = "全国大学排名"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var top_thirty_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Displays the Top 30 US News Ranked Undergradaute Programs"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        if language == .ES {
            bt.text = "Muestra los 30 mejores programas de pregrado clasificados por US News"
            
        } else if language == .ZH {
            bt.text = "显示美国新闻排名前 30 的本科课程"
        }
        bt.textColor = .white
        return bt
    }()
    //dumb
    
    
    
    lazy var top_thirty_rank_weighting : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Ranking are calculated by multiple measures of graduation and retention, social mobility, faculty resources, expert opinion, financial resources, student selectivity, and undergraduate reputation."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        if language == .ES {
            bt.text = "La clasificación se calcula mediante múltiples medidas de graduación y retención, movilidad social, recursos de la facultad, opinión de expertos, recursos financieros, selectividad de los estudiantes y reputación de los estudiantes."
            
        } else if language == .ZH {
            bt.text = "排名由毕业和保留、社会流动性、教师资源、专家意见、财政资源、学生选择性和本科声誉等多项指标计算得出"
        }
        bt.textColor = .white
        return bt
    }()
    
    
    //MARK: BUSINESS
    lazy var business_CV: UIButton = {

        //declare an object of layout
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv

    }()
    
    lazy var business_image : UIImageView = {
        let image = UIImage(named: "business")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var business_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Business Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Camino Comercial"
            
        } else if language == .ZH {
            bt.text = "商业途径"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var business_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Students in a business major learn fundamental business knowledge in accounting, international business, finance, marketing, project management, economics and more. Students can tailor their coursework to specific types of business courses or generalize. People who study business can land in many fields of work even if business is not the end goal."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.text = "Los estudiantes de una especialización en negocios adquieren conocimientos empresariales fundamentales en contabilidad, negocios internacionales, finanzas, marketing, gestión de proyectos, economía y más. Los estudiantes pueden adaptar sus cursos a tipos específicos de cursos de negocios o generalizar. Las personas que estudian negocios pueden aterrizar en muchos campos de trabajo incluso si los negocios no son el objetivo final."
            
        } else if language == .ZH {
            bt.text = "商科专业的学生学习会计、国际商务、金融、市场营销、项目管理、经济学等方面的基本商业知识。 学生可以根据特定类型的商业课程定制他们的课程或进行概括。 即使商业不是最终目标，学习商业的人也可以进入许多工作领域。"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var business_degrees : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Total Degrees: 390,600"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.text = "Grados Totales: 390,600"
            
        } else if language == .ZH {
            bt.text = "总度数: 390,600"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var business_percent : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Percent Degrees: 19%"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.text = "Grados porcentuales: 19%"
            
        } else if language == .ZH {
            bt.text = "百分比度数：19%"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var link_icon : UIImageView = {
        let domain_image = UIImage(named: "white_domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        return domain_image_view
        
    } ()
    
    lazy var business_job_btn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Potential Business Jobs", for: .normal)
        
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 12)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.setTitle("Empleos comerciales potenciales", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
            
        } else if language == .ZH {
            bt.setTitle("潜在的商业工作", for: .normal)
        }
        
        
        
        bt.addSubview(link_icon)
        
        link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 5).isActive = true
        link_icon.centerYAnchor.constraint(equalTo: bt.titleLabel!.centerYAnchor).isActive = true
        link_icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        link_icon.widthAnchor.constraint(equalToConstant: 15).isActive = true

        bt.addTarget(self, action: #selector(potential_job_tap(sender:)), for: .touchUpInside)
        return bt
    } ()
    
    

    //MARK: BIOLOGY
    lazy var bio_CV: UIButton = {

        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv
        

    }()
    
    lazy var bio_image : UIImageView = {
        let image = UIImage(named: "bio")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var bio_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Biology Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Vía de Biología"
            
        } else if language == .ZH {
            bt.text = "生物学途径"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var bio_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "A biology major studies the science behind living organisms. This includes the origin and history of animal and plant life, and their characteristics, function, processes and habits. Biology majors develop the fundamentals needed to pursue a career or graduate-level work in the life sciences and medicine, dentistry and other allied health careers."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
        if language == .ES {
            bt.text = "Una especialidad en biología estudia la ciencia detrás de los organismos vivos. Esto incluye el origen y la historia de la vida animal y vegetal, y sus características, función, procesos y hábitos. Los estudiantes de biología desarrollan los fundamentos necesarios para seguir una carrera o un trabajo de posgrado en ciencias de la vida y medicina, odontología y otras carreras relacionadas con la salud."
            
        } else if language == .ZH {
            bt.text = "生物学专业研究生物体背后的科学。 这包括动植物生命的起源和历史，以及它们的特征、功能、过程和习性。 生物学专业的学生培养了在生命科学和医学、牙科和其他相关健康职业中从事职业或研究生工作所需的基础知识。"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var bio_degrees : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Total Degrees: 121,200"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.text = "Grados Totales: 121,200"
            
        } else if language == .ZH {
            bt.text = "总度数: 121,200"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var bio_percent : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Percent Degrees: 6%"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.text = "Grados porcentuales: 6%"
            
        } else if language == .ZH {
            bt.text = "百分比度数：6%"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var bio_link_icon : UIImageView = {
        let domain_image = UIImage(named: "white_domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        return domain_image_view
        
    } ()
    
    
    lazy var bio_job_btn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Potential Biology Jobs", for: .normal)
        
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 12)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.setTitle("Posibles trabajos de biología", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
            
        } else if language == .ZH {
            bt.setTitle("潜在的生物学工作", for: .normal)
        }
        
        
        
        bt.addSubview(bio_link_icon)
        
        bio_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 5).isActive = true
        bio_link_icon.centerYAnchor.constraint(equalTo: bt.titleLabel!.centerYAnchor).isActive = true
        bio_link_icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        bio_link_icon.widthAnchor.constraint(equalToConstant: 15).isActive = true

        bt.addTarget(self, action: #selector(potential_job_tap(sender:)), for: .touchUpInside)
        return bt
    } ()
    

    //MARK: POLI SCIENCE
    lazy var poli_science_CV: UIButton = {

        //declare an object of layout
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv
    }()

    lazy var poli_science_image : UIImageView = {
        let image = UIImage(named: "poli_science")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var poli_science_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Political Science Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Vía de Ciencias Políticas"
            
        } else if language == .ZH {
            bt.text = "政治学途径"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var poli_science_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "A political science major will examine the nature of power and governments while building skills in analysis, research and more. Students who keep up with current events and have a penchant for debate might be interested in the major. With a degree in political science, you’ll be well-equipped to understand the forces that guide political processes."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
        if language == .ES {
            bt.text = "Un estudiante de ciencias políticas examinará la naturaleza del poder y los gobiernos mientras desarrolla habilidades en análisis, investigación y más. Los estudiantes que se mantienen al día con los acontecimientos actuales y tienen una inclinación por el debate pueden estar interesados en la especialización. Con un título en ciencias políticas, estará bien equipado para comprender las fuerzas que guían los procesos políticos."
            
        } else if language == .ZH {
            bt.text = "政治学专业将研究权力和政府的本质，同时培养分析、研究等方面的技能。 紧跟时事并喜欢辩论的学生可能会对专业感兴趣。 拥有政治学学位，您将有能力了解指导政治进程的力量。"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var poli_science_degrees : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Total Degrees: 160,600"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.text = "Grados Totales: 160,600"
            
        } else if language == .ZH {
            bt.text = "总度数: 160,600"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var poli_science_percent : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Percent Degrees: 8%"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.text = "Grados porcentuales: 8%"
            
        } else if language == .ZH {
            bt.text = "百分比度数：8%"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var poli_science_link_icon : UIImageView = {
        let domain_image = UIImage(named: "white_domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        return domain_image_view
        
    } ()
    
    
    lazy var poli_science_job_btn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Potential Political Science Jobs", for: .normal)
        
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
    
        //MARK: STILL NEEDS TRANSLATION
        if language == .ES {
            bt.setTitle("Empleos Potenciales en Ciencias Políticas", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 9)
            
        } else if language == .ZH {
            bt.setTitle("潜在的政治学工作", for: .normal)
        }
        
        
        
        bt.addSubview(poli_science_link_icon)
        
        poli_science_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 3).isActive = true
        poli_science_link_icon.centerYAnchor.constraint(equalTo: bt.titleLabel!.centerYAnchor).isActive = true
        poli_science_link_icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        poli_science_link_icon.widthAnchor.constraint(equalToConstant: 15).isActive = true

        bt.addTarget(self, action: #selector(potential_job_tap(sender:)), for: .touchUpInside)
        return bt
    } ()
    
    
    //MARK: ENGINEERING
    lazy var engineering_CV: UIButton = {

        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv

    }()
    
    lazy var engineering_image : UIImageView = {
        let image = UIImage(named: "engineering")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var engineering_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Engineering Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Ranking Nacional de Universidades"
            
        } else if language == .ZH {
            bt.text = "全国大学排名"
        }
        bt.textColor = .white
        return bt
    }()
    
    //MARK: UI SETUP
    
    public func setup_UI () {
        view.backgroundColor = .black
        setup_college_label()
        
        scroll_view.translatesAutoresizingMaskIntoConstraints = false
        scroll_content_view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll_view)
        scroll_view.addSubview(scroll_content_view)
               
        scroll_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scroll_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scroll_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        scroll_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scroll_content_view.centerXAnchor.constraint(equalTo: scroll_view.centerXAnchor).isActive = true
        scroll_content_view.widthAnchor.constraint(equalTo: scroll_view.widthAnchor).isActive = true
        scroll_content_view.topAnchor.constraint(equalTo: scroll_view.topAnchor).isActive = true
        scroll_content_view.bottomAnchor.constraint(equalTo: scroll_view.bottomAnchor).isActive = true
        

        setup_top_thirty()
        setup_business()
        setup_bio()
        setup_poli_science()
        setup_engineering()
    }
    
    public func setup_college_label (){
        view.addSubview(college_title)
        college_title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        college_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 53).isActive = true
    }
    
    //MARK: SETUP TOP THIRTY
    public func setup_top_thirty(){
        scroll_content_view.addSubview(top_thirty_CV)
        
        
        top_thirty_CV.topAnchor.constraint(equalTo: scroll_content_view.topAnchor, constant: 0).isActive = true
        top_thirty_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        top_thirty_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        
        top_thirty_CV.addSubview(top_thirty_image)
        top_thirty_image.topAnchor.constraint(equalTo: top_thirty_CV.topAnchor, constant: 10).isActive = true
        top_thirty_image.trailingAnchor.constraint(equalTo: top_thirty_CV.trailingAnchor, constant: -10).isActive = true
        top_thirty_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        top_thirty_image.heightAnchor.constraint(equalTo: top_thirty_image.widthAnchor).isActive = true
        
        top_thirty_CV.addSubview(top_thirty_title)
        top_thirty_title.topAnchor.constraint(equalTo: top_thirty_CV.topAnchor, constant: 20).isActive = true
        top_thirty_title.leadingAnchor.constraint(equalTo: top_thirty_CV.leadingAnchor, constant: 20).isActive = true
        
        top_thirty_CV.addSubview(top_thirty_description)
        top_thirty_description.topAnchor.constraint(equalTo: top_thirty_title.bottomAnchor, constant: 7).isActive = true
        top_thirty_description.leadingAnchor.constraint(equalTo: top_thirty_CV.leadingAnchor, constant: 20).isActive = true
        top_thirty_description.trailingAnchor.constraint(equalTo: top_thirty_image.leadingAnchor, constant: -5).isActive = true
        
        top_thirty_CV.addSubview(top_thirty_rank_weighting)
        top_thirty_rank_weighting.topAnchor.constraint(equalTo: top_thirty_image.bottomAnchor, constant: 5).isActive = true
        top_thirty_rank_weighting.leadingAnchor.constraint(equalTo: top_thirty_CV.leadingAnchor, constant: 20).isActive = true
        top_thirty_rank_weighting.trailingAnchor.constraint(equalTo: top_thirty_image.leadingAnchor, constant: -20).isActive = true
        top_thirty_CV.bottomAnchor.constraint(equalTo: top_thirty_rank_weighting.bottomAnchor, constant: 20).isActive = true
        
        
    }
    //MARK: SETUP BUSINESS
    public func setup_business(){
        scroll_content_view.addSubview(business_CV)
        
        business_CV.topAnchor.constraint(equalTo: top_thirty_CV.bottomAnchor, constant: 25).isActive = true
        business_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        business_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        
        business_CV.addSubview(business_image)
        business_image.topAnchor.constraint(equalTo: business_CV.topAnchor, constant: 10).isActive = true
        business_image.trailingAnchor.constraint(equalTo: business_CV.trailingAnchor, constant: -10).isActive = true
        business_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        business_image.heightAnchor.constraint(equalTo: business_image.widthAnchor).isActive = true
        
        business_CV.addSubview(business_title)
        business_title.topAnchor.constraint(equalTo: business_CV.topAnchor, constant: 20).isActive = true
        business_title.leadingAnchor.constraint(equalTo: business_CV.leadingAnchor, constant: 20).isActive = true
        
        business_CV.addSubview(business_description)
        business_description.topAnchor.constraint(equalTo: business_title.bottomAnchor, constant: 10).isActive = true
        business_description.leadingAnchor.constraint(equalTo: business_title.leadingAnchor).isActive = true
        business_description.trailingAnchor.constraint(equalTo: business_image.leadingAnchor, constant: -45).isActive = true
        
        business_CV.addSubview(business_degrees)
        business_degrees.topAnchor.constraint(equalTo: business_image.bottomAnchor, constant: 15).isActive = true
        business_degrees.leadingAnchor.constraint(equalTo: business_description.trailingAnchor, constant: 15).isActive = true
        business_degrees.trailingAnchor.constraint(equalTo: business_image.trailingAnchor).isActive = true
        
        business_CV.addSubview(business_percent)
        business_percent.topAnchor.constraint(equalTo: business_degrees.bottomAnchor, constant: 15).isActive = true
        business_percent.leadingAnchor.constraint(equalTo: business_description.trailingAnchor, constant: 15).isActive = true
        business_percent.trailingAnchor.constraint(equalTo: business_image.trailingAnchor).isActive = true
        
        business_CV.addSubview(business_job_btn)
        business_job_btn.topAnchor.constraint(equalTo: business_description.bottomAnchor, constant:15).isActive = true
        business_job_btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        business_job_btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        business_job_btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        business_CV.bottomAnchor.constraint(equalTo: business_job_btn.bottomAnchor, constant: 25).isActive = true

    }
    //MARK: SETUP BIO
    public func setup_bio(){
        scroll_content_view.addSubview(bio_CV)
        
        bio_CV.topAnchor.constraint(equalTo: business_CV.bottomAnchor, constant: 25).isActive = true
        bio_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        bio_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        
        bio_CV.addSubview(bio_image)
        bio_image.topAnchor.constraint(equalTo: bio_CV.topAnchor, constant: 10).isActive = true
        bio_image.trailingAnchor.constraint(equalTo: bio_CV.trailingAnchor, constant: -10).isActive = true
        bio_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        bio_image.heightAnchor.constraint(equalTo: business_image.widthAnchor).isActive = true
        
        bio_CV.addSubview(bio_title)
        bio_title.topAnchor.constraint(equalTo: bio_CV.topAnchor, constant: 20).isActive = true
        bio_title.leadingAnchor.constraint(equalTo: bio_CV.leadingAnchor, constant: 20).isActive = true
        
        bio_CV.addSubview(bio_description)
        bio_description.topAnchor.constraint(equalTo: bio_title.bottomAnchor, constant: 10).isActive = true
        bio_description.leadingAnchor.constraint(equalTo: bio_title.leadingAnchor).isActive = true
        bio_description.trailingAnchor.constraint(equalTo: bio_image.leadingAnchor, constant: -45).isActive = true
        
        bio_CV.addSubview(bio_degrees)
        bio_degrees.topAnchor.constraint(equalTo: bio_image.bottomAnchor, constant: 15).isActive = true
        bio_degrees.leadingAnchor.constraint(equalTo: bio_description.trailingAnchor, constant: 15).isActive = true
        bio_degrees.trailingAnchor.constraint(equalTo: bio_image.trailingAnchor).isActive = true
        
        bio_CV.addSubview(bio_percent)
        bio_percent.topAnchor.constraint(equalTo: bio_degrees.bottomAnchor, constant: 15).isActive = true
        bio_percent.leadingAnchor.constraint(equalTo: bio_description.trailingAnchor, constant: 15).isActive = true
        bio_percent.trailingAnchor.constraint(equalTo: bio_image.trailingAnchor).isActive = true
        
        bio_CV.addSubview(bio_job_btn)
        bio_job_btn.topAnchor.constraint(equalTo: bio_description.bottomAnchor, constant:15).isActive = true
        bio_job_btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bio_job_btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        bio_job_btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        bio_CV.bottomAnchor.constraint(equalTo: bio_job_btn.bottomAnchor, constant: 25).isActive = true

    }
    //MARK: SETUP POLI SCIENCE
    public func setup_poli_science(){
        scroll_content_view.addSubview(poli_science_CV)
        
        poli_science_CV.topAnchor.constraint(equalTo: bio_CV.bottomAnchor, constant: 25).isActive = true
        poli_science_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        poli_science_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        poli_science_CV.addSubview(poli_science_image)
        poli_science_image.topAnchor.constraint(equalTo: poli_science_CV.topAnchor, constant: 10).isActive = true
        poli_science_image.trailingAnchor.constraint(equalTo: poli_science_CV.trailingAnchor, constant: -10).isActive = true
        poli_science_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        poli_science_image.heightAnchor.constraint(equalTo: poli_science_image.widthAnchor).isActive = true
        
        poli_science_CV.addSubview(poli_science_title)
        poli_science_title.topAnchor.constraint(equalTo: poli_science_CV.topAnchor, constant: 20).isActive = true
        poli_science_title.leadingAnchor.constraint(equalTo: poli_science_CV.leadingAnchor, constant: 20).isActive = true
        
        poli_science_CV.addSubview(poli_science_description)
        poli_science_description.topAnchor.constraint(equalTo: poli_science_title.bottomAnchor, constant: 10).isActive = true
        poli_science_description.leadingAnchor.constraint(equalTo: poli_science_title.leadingAnchor).isActive = true
        poli_science_description.trailingAnchor.constraint(equalTo: poli_science_image.leadingAnchor, constant: -45).isActive = true
        
        poli_science_CV.addSubview(poli_science_degrees)
        poli_science_degrees.topAnchor.constraint(equalTo: poli_science_image.bottomAnchor, constant: 15).isActive = true
        poli_science_degrees.leadingAnchor.constraint(equalTo: poli_science_description.trailingAnchor, constant: 15).isActive = true
        poli_science_degrees.trailingAnchor.constraint(equalTo: poli_science_image.trailingAnchor).isActive = true
        
        poli_science_CV.addSubview(poli_science_percent)
        poli_science_percent.topAnchor.constraint(equalTo: poli_science_degrees.bottomAnchor, constant: 15).isActive = true
        poli_science_percent.leadingAnchor.constraint(equalTo: poli_science_description.trailingAnchor, constant: 15).isActive = true
        poli_science_percent.trailingAnchor.constraint(equalTo: poli_science_image.trailingAnchor).isActive = true
        
        poli_science_CV.addSubview(poli_science_job_btn)
        poli_science_job_btn.topAnchor.constraint(equalTo: poli_science_description.bottomAnchor, constant:15).isActive = true
        poli_science_job_btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        poli_science_job_btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        poli_science_job_btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        poli_science_CV.bottomAnchor.constraint(equalTo: poli_science_job_btn.bottomAnchor, constant: 25).isActive = true
    }
    
    //MARK: SETUP ENGINEERING
    public func setup_engineering(){
        scroll_content_view.addSubview(engineering_CV)
        
        //MARK: THE VERY LAST ELEMENT OF A SCROLL VIEW NEEDS A SCROLL_CONTENT_VIEW.BOTTOM ANCHOR
        engineering_CV.topAnchor.constraint(equalTo: poli_science_CV.bottomAnchor, constant: 25).isActive = true
        engineering_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        engineering_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        engineering_CV.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        engineering_CV.bottomAnchor.constraint(equalTo: scroll_content_view.bottomAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_image)
        engineering_image.topAnchor.constraint(equalTo: engineering_CV.topAnchor, constant: 10).isActive = true
        engineering_image.trailingAnchor.constraint(equalTo: engineering_CV.trailingAnchor, constant: -10).isActive = true
        engineering_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        engineering_image.heightAnchor.constraint(equalTo: engineering_image.widthAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_title)
        engineering_title.topAnchor.constraint(equalTo: engineering_CV.topAnchor, constant: 20).isActive = true
        engineering_title.leadingAnchor.constraint(equalTo: engineering_CV.leadingAnchor, constant: 20).isActive = true
    }

    //MARK: OBJC C PRESENT SUBJECT VIEW + Potential Job
    
    @objc func present_College_Subject_VC () {
        self.present(College_Subject_VC(), animated: true, completion: nil)
    }
    
    @objc func potential_job_tap(sender: AnyObject) {
        
        var url = URL(string: "https://www.google.com/?client=safari")
        
        
        if sender.isDescendant(of: business_job_btn) {
            url = URL(string: "https://www.bestcolleges.com/careers/business/")
        }
        
        if sender.isDescendant(of: bio_job_btn) {
            url = URL(string: "https://www.bestcolleges.com/careers/science-and-engineering/biology/")
        }
        
        if sender.isDescendant(of: poli_science_job_btn) {
            url = URL(string: "https://www.bestcolleges.com/blog/what-to-do-with-a-political-science-degree/")
        }
        
        //
        
        
        let vc = SFSafariViewController(url: url!)
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    
    //MARK: View Did Load
    override func viewDidLoad(){
        super.viewDidLoad()
        setup_UI()
        print("Greetings from \(UIDevice.current.systemVersion)")
    }
    
}
