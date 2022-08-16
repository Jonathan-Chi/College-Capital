
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
    
        
        if language == .ES {
            bt.setTitle("Empleos comerciales potenciales", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
            
        } else if language == .ZH {
            bt.setTitle("潜在的商业工作", for: .normal)
        }
        
        
        
        bt.addSubview(link_icon)
        
        link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 3).isActive = true
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
    
        
        if language == .ES {
            bt.setTitle("Posibles trabajos de biología", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
            
        } else if language == .ZH {
            bt.setTitle("潜在的生物学工作", for: .normal)
        }
        
        
        
        bt.addSubview(bio_link_icon)
        
        bio_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 3).isActive = true
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
    
        
        if language == .ES {
            bt.setTitle("Empleos potenciales en ciencias políticas", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 8)
            
        } else if language == .ZH {
            bt.setTitle("潜在的政治学工作", for: .normal)
        }
        
        
        
        bt.addSubview(poli_science_link_icon)
        
        poli_science_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 2).isActive = true
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
            bt.text = "Vía de ingeniería"
            
        } else if language == .ZH {
            bt.text = "工程途径"
        }
        bt.textColor = .white
        return bt
    }()
    
    
    lazy var engineering_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "An engineering major is an interdisciplinary study of math, science and some business principles. General engineering courses teach students how to design and conduct experiments, to identify and solve problems, to understand professional and ethical responsibility, and to communicate effectively. Students will learn that engineering requires a career-long commitment to education in the field, as staying up on new products and problem-solving methods is beneficial to job advancement."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
        if language == .ES {
            bt.text = "Una especialización en ingeniería es un estudio interdisciplinario de matemáticas, ciencias y algunos principios comerciales. Los cursos de ingeniería general enseñan a los estudiantes cómo diseñar y realizar experimentos, identificar y resolver problemas, comprender la responsabilidad profesional y ética y comunicarse de manera efectiva. Los estudiantes aprenderán que la ingeniería requiere un compromiso de toda la carrera con la educación en el campo, ya que mantenerse actualizado sobre nuevos productos y métodos de resolución de problemas es beneficioso para el avance laboral."
            
        } else if language == .ZH {
            bt.text = "工程专业是数学、科学和一些商业原则的跨学科研究。 通用工程课程教授学生如何设计和进行实验、识别和解决问题、理解专业和道德责任以及有效沟通。 学生将了解到工程学需要对该领域的教育做出长期的职业承诺，因为坚持使用新产品和解决问题的方法有利于工作晋升。"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var engineering_degrees : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Total Degrees: 126,700"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados Totales: 126,700"
            
        } else if language == .ZH {
            bt.text = "总度数: 126,700"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var engineering_percent : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Percent Degrees: 6%"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados porcentuales: 6%"
            
        } else if language == .ZH {
            bt.text = "百分比度数：6%"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var engineering_link_icon : UIImageView = {
        let domain_image = UIImage(named: "white_domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        return domain_image_view
        
    } ()
    
    
    lazy var engineering_job_btn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Potential Engineering Jobs", for: .normal)
        
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
    
        
        if language == .ES {
            bt.setTitle("Empleos potenciales de ingeniería", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 9)
            
        } else if language == .ZH {
            bt.setTitle("潜在的工程工作", for: .normal)
        }
        
        
        
        bt.addSubview(engineering_link_icon)
        
        engineering_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 3).isActive = true
        engineering_link_icon.centerYAnchor.constraint(equalTo: bt.titleLabel!.centerYAnchor).isActive = true
        engineering_link_icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        engineering_link_icon.widthAnchor.constraint(equalToConstant: 15).isActive = true

        bt.addTarget(self, action: #selector(potential_job_tap(sender:)), for: .touchUpInside)
        return bt
    } ()
    
    //MARK: PSYCH
    
    lazy var psych_CV: UIButton = {

        //declare an object of layout
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv

    }()
    
    lazy var psych_image : UIImageView = {
        let image = UIImage(named: "psych")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var psych_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Psychology Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Vía de Psicología"
            
            
        } else if language == .ZH {
            bt.text = "心理学途径"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var psych_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "A psychology major examines the science of human behavior and mental processes. This includes the study of the mind, the brain, and human and animal social interactions. The major touches on many different areas of psychology like social, cognitive, abnormal, personality and developmental."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        if language == .ES {
            bt.text = "Un estudiante de psicología examina la ciencia del comportamiento humano y los procesos mentales. Esto incluye el estudio de la mente, el cerebro y las interacciones sociales humanas y animales. El principal toca muchas áreas diferentes de la psicología como social, cognitiva, anormal, personalidad y desarrollo."
            
        } else if language == .ZH {
            bt.text = "心理学专业研究人类行为和心理过程的科学。 这包括对心灵、大脑以及人类和动物社会互动的研究。 主要涉及许多不同的心理学领域，如社会、认知、异常、个性和发展。"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var psych_degrees : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Total Degrees: 116,500"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados Totales: 116,500"
            
        } else if language == .ZH {
            bt.text = "总度数: 116,500"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var psych_percent : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Percent Degrees: 6%"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados porcentuales: 6%"
            
        } else if language == .ZH {
            bt.text = "百分比度数：6%"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var psych_link_icon : UIImageView = {
        let domain_image = UIImage(named: "white_domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        return domain_image_view
        
    } ()
    
    lazy var psych_job_btn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Potential Psychology Jobs", for: .normal)
        
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 12)
    
        
        if language == .ES {
            bt.setTitle("Empleos potenciales de psicología", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 8)
            
        } else if language == .ZH {
            bt.setTitle("潜在的心理学工作", for: .normal)
        }
        
        
        
        bt.addSubview(psych_link_icon)
        
        psych_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 3).isActive = true
        psych_link_icon.centerYAnchor.constraint(equalTo: bt.titleLabel!.centerYAnchor).isActive = true
        psych_link_icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        psych_link_icon.widthAnchor.constraint(equalToConstant: 15).isActive = true

        bt.addTarget(self, action: #selector(potential_job_tap(sender:)), for: .touchUpInside)
        return bt
    } ()
    
    
    //MARK: COMP SCIENCE
    
    lazy var comp_science_CV: UIButton = {

        //declare an object of layout
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv

    }()
    
    lazy var comp_science_image : UIImageView = {
        let image = UIImage(named: "comp_science")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var comp_science_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Computer Science Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Vía de Ciencias de la Computación"
            
        } else if language == .ZH {
            bt.text = "计算机科学途径"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var comp_science_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Students in a computer science major enter the dynamic world of technology, studying topics like artificial intelligence, software design and computer graphics. By the time majors complete their degrees, they will have the skills to examine complex problems with computer tools."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        if language == .ES {
            bt.text = "Los estudiantes de una especialización en informática ingresan al mundo dinámico de la tecnología, estudiando temas como inteligencia artificial, diseño de software y gráficos por computadora. Cuando los estudiantes de especialización completen sus títulos, tendrán las habilidades para examinar problemas complejos con herramientas informáticas."
            
        } else if language == .ZH {
            bt.text = "计算机科学专业的学生进入动态的技术世界，学习人工智能、软件设计和计算机图形学等主题。 到专业完成学位时，他们将具备使用计算机工具检查复杂问题的技能。"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var comp_science_degrees : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Total Degrees: 88,600"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados Totales: 88,600"
            
        } else if language == .ZH {
            bt.text = "总度数: 88,600"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var comp_science_percent : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Percent Degrees: 4%"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados porcentuales: 4%"
            
        } else if language == .ZH {
            bt.text = "百分比度数：4%"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var comp_science_link_icon : UIImageView = {
        let domain_image = UIImage(named: "white_domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        return domain_image_view
        
    } ()
    
    lazy var comp_science_job_btn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Potential Computer Science Jobs", for: .normal)
        
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
    
        
        if language == .ES {
            bt.setTitle("Empleos potenciales en informática", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 8)
            
        } else if language == .ZH {
            bt.setTitle("潜在的计算机科学工作", for: .normal)
        }
        
        
        
        bt.addSubview(comp_science_link_icon)
        
        comp_science_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 3).isActive = true
        comp_science_link_icon.centerYAnchor.constraint(equalTo: bt.titleLabel!.centerYAnchor).isActive = true
        comp_science_link_icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        comp_science_link_icon.widthAnchor.constraint(equalToConstant: 15).isActive = true

        bt.addTarget(self, action: #selector(potential_job_tap(sender:)), for: .touchUpInside)
        return bt
    } ()
    
    
    //MARK: NURSING
    
    lazy var nursing_CV: UIButton = {

        //declare an object of layout
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv

    }()
    
    lazy var nursing_image : UIImageView = {
        let image = UIImage(named: "nursing")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var nursing_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Nursing Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Camino de Enfermería"
            
        } else if language == .ZH {
            bt.text = "护理途径"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var nursing_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "A nursing major prepares students for a career path in nursing administration, nursing research and clinical nursing. Nursing students are equipped with the skills needed to assess clinical scenarios, navigate patient interactions and work successfully in a variety of health care settings. Graduates with a nursing degree will be ready to become a registered nurse, provide comprehensive service in a health care or research setting, and make a lasting impact on patients and their families, physicians and other health professionals they interact with."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        if language == .ES {
            bt.text = "Una especialización en enfermería prepara a los estudiantes para una carrera en administración de enfermería, investigación de enfermería y enfermería clínica. Los estudiantes de enfermería están equipados con las habilidades necesarias para evaluar escenarios clínicos, navegar las interacciones con los pacientes y trabajar con éxito en una variedad de entornos de atención médica. Los graduados con un título en enfermería estarán listos para convertirse en enfermeros registrados, brindar un servicio integral en un entorno de atención médica o de investigación, y tener un impacto duradero en los pacientes y sus familias, médicos y otros profesionales de la salud con los que interactúan."
            
        } else if language == .ZH {
            bt.text = "护理专业为学生在护理管理、护理研究和临床护理方面的职业道路做好准备。 护理专业的学生具备评估临床情景、引导患者互动和在各种医疗保健环境中成功工作所需的技能。 拥有护理学位的毕业生将准备好成为一名注册护士，在医疗保健或研究环境中提供全面的服务，并对患者及其家人、医生和与他们互动的其他卫生专业人员产生持久的影响。"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var nursing_degrees : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Total Degrees: 251,400"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados Totales: 251,400"
            
        } else if language == .ZH {
            bt.text = "总度数: 251,400"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var nursing_percent : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Percent Degrees: 12%"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        
        if language == .ES {
            bt.text = "Grados porcentuales: 12%"
            
        } else if language == .ZH {
            bt.text = "百分比度数：12%"
        }
        bt.textColor = .white
        return bt
    } ()
    
    lazy var nursing_link_icon : UIImageView = {
        let domain_image = UIImage(named: "white_domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        return domain_image_view
        
    } ()
    
    lazy var nursing_job_btn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Potential Nursing Jobs", for: .normal)
        
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        bt.layer.borderWidth = 2
        bt.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 12)
    
        
        if language == .ES {
            bt.setTitle("Posibles trabajos de enfermería", for: .normal)
            bt.titleLabel?.font = UIFont(name: "OpenSansRoman-Bold", size: 10)
            
        } else if language == .ZH {
            bt.setTitle("潜在的护理工作", for: .normal)
        }
        
        
        
        bt.addSubview(nursing_link_icon)
        
        nursing_link_icon.leadingAnchor.constraint(equalTo: bt.titleLabel!.trailingAnchor, constant: 3).isActive = true
        nursing_link_icon.centerYAnchor.constraint(equalTo: bt.titleLabel!.centerYAnchor).isActive = true
        nursing_link_icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        nursing_link_icon.widthAnchor.constraint(equalToConstant: 15).isActive = true

        bt.addTarget(self, action: #selector(potential_job_tap(sender:)), for: .touchUpInside)
        return bt
    } ()
    
    
    
    
    
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
        setup_psych()
        setup_comp_science()
        setup_nursing()
    }
    
    public func setup_college_label (){
        view.addSubview(college_title)
        college_title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        college_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
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
        
        
        engineering_CV.topAnchor.constraint(equalTo: poli_science_CV.bottomAnchor, constant: 25).isActive = true
        engineering_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        engineering_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_image)
        engineering_image.topAnchor.constraint(equalTo: engineering_CV.topAnchor, constant: 10).isActive = true
        engineering_image.trailingAnchor.constraint(equalTo: engineering_CV.trailingAnchor, constant: -10).isActive = true
        engineering_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        engineering_image.heightAnchor.constraint(equalTo: engineering_image.widthAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_title)
        engineering_title.topAnchor.constraint(equalTo: engineering_CV.topAnchor, constant: 20).isActive = true
        engineering_title.leadingAnchor.constraint(equalTo: engineering_CV.leadingAnchor, constant: 20).isActive = true
        
        
        engineering_CV.addSubview(engineering_description)
        engineering_description.topAnchor.constraint(equalTo: engineering_title.bottomAnchor, constant: 10).isActive = true
        engineering_description.leadingAnchor.constraint(equalTo: engineering_title.leadingAnchor).isActive = true
        engineering_description.trailingAnchor.constraint(equalTo: engineering_image.leadingAnchor, constant: -45).isActive = true
        
        engineering_CV.addSubview(engineering_degrees)
        engineering_degrees.topAnchor.constraint(equalTo: engineering_image.bottomAnchor, constant: 15).isActive = true
        engineering_degrees.leadingAnchor.constraint(equalTo: engineering_description.trailingAnchor, constant: 15).isActive = true
        engineering_degrees.trailingAnchor.constraint(equalTo: engineering_image.trailingAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_percent)
        engineering_percent.topAnchor.constraint(equalTo: engineering_degrees.bottomAnchor, constant: 15).isActive = true
        engineering_percent.leadingAnchor.constraint(equalTo: engineering_description.trailingAnchor, constant: 15).isActive = true
        engineering_percent.trailingAnchor.constraint(equalTo: engineering_image.trailingAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_job_btn)
        engineering_job_btn.topAnchor.constraint(equalTo: engineering_description.bottomAnchor, constant:15).isActive = true
        engineering_job_btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        engineering_job_btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        engineering_job_btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        engineering_CV.bottomAnchor.constraint(equalTo: engineering_job_btn.bottomAnchor, constant: 25).isActive = true
    }
    
    
    //MARK: SETUP PSYCH
    
    public func setup_psych(){
        scroll_content_view.addSubview(psych_CV)
        
        psych_CV.topAnchor.constraint(equalTo: engineering_CV.bottomAnchor, constant: 25).isActive = true
        psych_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        psych_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        
        
        psych_CV.addSubview(psych_image)
        psych_image.topAnchor.constraint(equalTo: psych_CV.topAnchor, constant: 10).isActive = true
        psych_image.trailingAnchor.constraint(equalTo: psych_CV.trailingAnchor, constant: -10).isActive = true
        psych_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        psych_image.heightAnchor.constraint(equalTo: psych_image.widthAnchor).isActive = true
        
        psych_CV.addSubview(psych_title)
        psych_title.topAnchor.constraint(equalTo: psych_CV.topAnchor, constant: 20).isActive = true
        psych_title.leadingAnchor.constraint(equalTo: psych_CV.leadingAnchor, constant: 20).isActive = true
        
        
        psych_CV.addSubview(psych_description)
        psych_description.topAnchor.constraint(equalTo: psych_title.bottomAnchor, constant: 10).isActive = true
        psych_description.leadingAnchor.constraint(equalTo: psych_title.leadingAnchor).isActive = true
        psych_description.trailingAnchor.constraint(equalTo: psych_image.leadingAnchor, constant: -45).isActive = true
        
        psych_CV.addSubview(psych_degrees)
        psych_degrees.topAnchor.constraint(equalTo: psych_image.bottomAnchor, constant: 15).isActive = true
        psych_degrees.leadingAnchor.constraint(equalTo: psych_description.trailingAnchor, constant: 15).isActive = true
        psych_degrees.trailingAnchor.constraint(equalTo: psych_image.trailingAnchor).isActive = true
        
        psych_CV.addSubview(psych_percent)
        psych_percent.topAnchor.constraint(equalTo: psych_degrees.bottomAnchor, constant: 15).isActive = true
        psych_percent.leadingAnchor.constraint(equalTo: psych_description.trailingAnchor, constant: 15).isActive = true
        psych_percent.trailingAnchor.constraint(equalTo: psych_image.trailingAnchor).isActive = true
        
        psych_CV.addSubview(psych_job_btn)
        psych_job_btn.topAnchor.constraint(equalTo: psych_description.bottomAnchor, constant:15).isActive = true
        psych_job_btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        psych_job_btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        psych_job_btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        psych_CV.bottomAnchor.constraint(equalTo: psych_job_btn.bottomAnchor, constant: 25).isActive = true
    }
    
    //MARK: SETUP COMP SCIENCE
    
    public func setup_comp_science(){
        scroll_content_view.addSubview(comp_science_CV)
        
        
        comp_science_CV.topAnchor.constraint(equalTo: psych_CV.bottomAnchor, constant: 25).isActive = true
        comp_science_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        comp_science_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        

        comp_science_CV.addSubview(comp_science_image)
        comp_science_image.topAnchor.constraint(equalTo: comp_science_CV.topAnchor, constant: 10).isActive = true
        comp_science_image.trailingAnchor.constraint(equalTo: comp_science_CV.trailingAnchor, constant: -10).isActive = true
        comp_science_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        comp_science_image.heightAnchor.constraint(equalTo: comp_science_image.widthAnchor).isActive = true
        
        comp_science_CV.addSubview(comp_science_title)
        comp_science_title.topAnchor.constraint(equalTo: comp_science_CV.topAnchor, constant: 20).isActive = true
        comp_science_title.leadingAnchor.constraint(equalTo: comp_science_CV.leadingAnchor, constant: 20).isActive = true
        
        
        comp_science_CV.addSubview(comp_science_description)
        comp_science_description.topAnchor.constraint(equalTo: comp_science_title.bottomAnchor, constant: 10).isActive = true
        comp_science_description.leadingAnchor.constraint(equalTo: comp_science_title.leadingAnchor).isActive = true
        comp_science_description.trailingAnchor.constraint(equalTo: comp_science_image.leadingAnchor, constant: -45).isActive = true
        
        comp_science_CV.addSubview(comp_science_degrees)
        comp_science_degrees.topAnchor.constraint(equalTo: comp_science_image.bottomAnchor, constant: 15).isActive = true
        comp_science_degrees.leadingAnchor.constraint(equalTo: comp_science_description.trailingAnchor, constant: 15).isActive = true
        comp_science_degrees.trailingAnchor.constraint(equalTo: comp_science_image.trailingAnchor).isActive = true
        
        comp_science_CV.addSubview(comp_science_percent)
        comp_science_percent.topAnchor.constraint(equalTo: comp_science_degrees.bottomAnchor, constant: 15).isActive = true
        comp_science_percent.leadingAnchor.constraint(equalTo: comp_science_description.trailingAnchor, constant: 15).isActive = true
        comp_science_percent.trailingAnchor.constraint(equalTo: comp_science_image.trailingAnchor).isActive = true
        
        comp_science_CV.addSubview(comp_science_job_btn)
        comp_science_job_btn.topAnchor.constraint(equalTo: comp_science_description.bottomAnchor, constant:15).isActive = true
        comp_science_job_btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        comp_science_job_btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        comp_science_job_btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        comp_science_CV.bottomAnchor.constraint(equalTo: comp_science_job_btn.bottomAnchor, constant: 25).isActive = true
    }
    
    
    //MARK: SETUP NURSING
    
    public func setup_nursing(){
        scroll_content_view.addSubview(nursing_CV)
        
        
        nursing_CV.topAnchor.constraint(equalTo: comp_science_CV.bottomAnchor, constant: 25).isActive = true
        nursing_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9.5/10).isActive = true
        nursing_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        nursing_CV.bottomAnchor.constraint(equalTo: scroll_content_view.bottomAnchor).isActive = true
        
        nursing_CV.addSubview(nursing_image)
        nursing_image.topAnchor.constraint(equalTo: nursing_CV.topAnchor, constant: 10).isActive = true
        nursing_image.trailingAnchor.constraint(equalTo: nursing_CV.trailingAnchor, constant: -10).isActive = true
        nursing_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        nursing_image.heightAnchor.constraint(equalTo: nursing_image.widthAnchor).isActive = true
        
        nursing_CV.addSubview(nursing_title)
        nursing_title.topAnchor.constraint(equalTo: nursing_CV.topAnchor, constant: 20).isActive = true
        nursing_title.leadingAnchor.constraint(equalTo: nursing_CV.leadingAnchor, constant: 20).isActive = true
        
        
        nursing_CV.addSubview(nursing_description)
        nursing_description.topAnchor.constraint(equalTo: nursing_title.bottomAnchor, constant: 10).isActive = true
        nursing_description.leadingAnchor.constraint(equalTo: nursing_title.leadingAnchor).isActive = true
        nursing_description.trailingAnchor.constraint(equalTo: nursing_image.leadingAnchor, constant: -45).isActive = true
        
        nursing_CV.addSubview(nursing_degrees)
        nursing_degrees.topAnchor.constraint(equalTo: nursing_image.bottomAnchor, constant: 15).isActive = true
        nursing_degrees.leadingAnchor.constraint(equalTo: nursing_description.trailingAnchor, constant: 15).isActive = true
        nursing_degrees.trailingAnchor.constraint(equalTo: nursing_image.trailingAnchor).isActive = true
        
        nursing_CV.addSubview(nursing_percent)
        nursing_percent.topAnchor.constraint(equalTo: nursing_degrees.bottomAnchor, constant: 15).isActive = true
        nursing_percent.leadingAnchor.constraint(equalTo: nursing_description.trailingAnchor, constant: 15).isActive = true
        nursing_percent.trailingAnchor.constraint(equalTo: nursing_image.trailingAnchor).isActive = true
        
        nursing_CV.addSubview(nursing_job_btn)
        nursing_job_btn.topAnchor.constraint(equalTo: nursing_description.bottomAnchor, constant:15).isActive = true
        nursing_job_btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nursing_job_btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nursing_job_btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        nursing_CV.bottomAnchor.constraint(equalTo: nursing_job_btn.bottomAnchor, constant: 25).isActive = true
    }
    
    
    

    //MARK: OBJC C PRESENT SUBJECT VIEW + Potential Job
    
    
    
    @objc func present_College_Subject_VC (sender: AnyObject) {
        
        let college_subject = College_Subject_VC()
        
        if sender.isDescendant(of: top_thirty_CV){
            college_subject.college_indices = top_thirty_indices
            college_subject.subject_title.text = top_thirty_title.text
        }
        if sender.isDescendant(of: business_CV) {
            college_subject.college_indices = business
            college_subject.subject_title.text = business_title.text
        }
        if sender.isDescendant(of: bio_CV) {
            college_subject.college_indices = bio
            college_subject.subject_title.text = bio_title.text
        }
        if sender.isDescendant(of: poli_science_CV) {
            college_subject.college_indices = poli_science
            college_subject.subject_title.text = poli_science_title.text
        }
        if sender.isDescendant(of: engineering_CV) {
            college_subject.college_indices = engineering
            college_subject.subject_title.text = engineering_title.text
        }
        if sender.isDescendant(of: psych_CV) {
            college_subject.college_indices = psych
            college_subject.subject_title.text = psych_title.text
        }
        if sender.isDescendant(of: comp_science_CV) {
            college_subject.college_indices = comp_science
            college_subject.subject_title.text = comp_science_title.text
        }
        if sender.isDescendant(of: nursing_CV) {
            college_subject.college_indices = nursing
            college_subject.subject_title.text = nursing_title.text
        }
        
        
        
        self.present(college_subject, animated: true, completion: nil)
       
        
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
        
        if sender.isDescendant(of: engineering_job_btn) {
            url = URL(string: "https://www.indeed.com/career-advice/finding-a-job/what-can-you-do-with-an-engineering-degree")
        }
        
        if sender.isDescendant(of: psych_job_btn) {
            url = URL(string: "https://www.usnews.com/education/best-graduate-schools/articles/what-can-you-do-with-a-psychology-degree")
        }
        
        if sender.isDescendant(of: comp_science_job_btn) {
            url = URL(string: "https://www.usnews.com/education/best-graduate-schools/articles/2019-05-02/what-can-you-do-with-a-computer-science-degree")
        }
        
        if sender.isDescendant(of: nursing_job_btn) {
            url = URL(string: "https://nursejournal.org/articles/things-you-can-do-with-a-nursing-degree/")
        }
        
        
   
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
