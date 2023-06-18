(deftemplate question
    (slot id)
    (slot text))

(deftemplate ask
    (slot id)
    (slot text))

(deftemplate answer
    (slot id)
    (slot answer))

(deftemplate solution
    (slot solution))

(deftemplate description
    (slot description)
)

(deffacts questions
    "list of questions"
    (question (id 1) (text "Apakah anda senang menghitung?"))
    (question (id 2) (text "Apakah anda menyukai sains?"))
    (question (id 3) (text "Apakah anda menyukai matematika"))
    (question (id 4) (text "Apakah anda berniat untuk menjadi peneliti di bidang matematika?"))
    (question (id 5) (text "Apakah anda menyukai dunia kesehatan?"))
    (question (id 6) (text "Apakah anda menyukai dunia kedokteran?"))
    (question (id 7) (text "Apakah anda menyukai dunia bisnis?"))
    (question (id 8) (text "Apakah anda tertarik pada dunia analisis data dan statistika?"))
    (question (id 9) (text "Apakah anda tertarik pada teknologi dan komputer?"))
    (question (id 10) (text "Apakah anda senang ilmu sosial?"))
    (question (id 11) (text "Apakah anda tertarik dengan dunia politik?"))
    (question (id 12) (text "Apakah anda tertarik dengan dunia komunikasi?"))
    (question (id 13) (text "Apakah anda senang mengamati suatu kelompok?"))
    (question (id 14) (text "Apakah anda menyukai ilmu bahasa?"))
    (question (id 15) (text "Apakah anda menyukai ilmu kebudayaan?"))
    )

(defrule init-ask
    (question (id 1) (text ?text))
    =>
    (assert (ask (id 1) (text ?text))))



(defrule ask-question
    (ask (id ?i) (text ?text))
    (not (answer (id ?i)))
    =>
    (bind ?answer "")
    (while (and (neq (str-compare ?answer "yes") 0) (neq (str-compare ?answer "no") 0)) do
            (printout t ?text " [yes/no] : ")
            (bind ?answer (readline))
    	    (assert (answer (id ?i) (answer ?answer))))

    )



(defrule 1-yes-2
    (answer (id 1) (answer "yes"))
    (question (id 2 ) (text ?text))
    => 
    (assert (ask (id 2) (text ?text)))	
    )


(defrule 2-yes-3
    (answer (id 2) (answer "yes"))
    (question (id 3 ) (text ?text))
    => 
    (assert (ask (id 3) (text ?text)))	
    )

(defrule 3-yes-4
    (answer (id 3) (answer "yes"))
    (question (id 4 ) (text ?text))
    => 
    (assert (ask (id 4) (text ?text)))	
    )

(defrule 4-yes
    (answer (id 4) (answer "yes"))
    => 
    (assert (solution (solution "matematika murni")))	
    (assert (description (description "Jurusan ini mempelajari tentang matematika secara murni, tanpa adanya aplikasi pada bidang lain."))) 
    )

(defrule 4-no
    (answer (id 4) (answer "no"))
    => 
    (assert (solution (solution "matematika terapan / teknik")))	
    (assert (description (description "Jurusan ini mempelajari tentang matematika yang diterapkan pada bidang lain, seperti teknik, komputer, dan lain-lain.")))
    )

(defrule 3-no-5
    (answer (id 3) (answer "no"))
    (question (id 5 ) (text ?text))
    => 
    (assert (ask (id 5) (text ?text)))	
    )


(defrule 5-no
    (answer (id 5) (answer "no"))
    => 
    (assert (solution (solution "biologi")))	
    (assert (description (description "Jurusan ini mempelajari tentang kehidupan, baik itu hewan, tumbuhan, maupun manusia.")))
    )

(defrule 5-yes-6
    (answer (id 5) (answer "yes"))
    (question (id 6 ) (text ?text))
    => 
    (assert (ask (id 6) (text ?text)))	
    )

(defrule 6-no
    (answer (id 6) (answer "no"))
    => 
    (assert (solution (solution "farmasi")))	
    (assert (description (description "Jurusan ini mempelajari tentang obat-obatan dan cara pembuatannya."))
    ))

(defrule 6-yes
    (answer (id 6) (answer "yes"))
    => 
    (assert (solution (solution "kedokteran")))	
    (assert (description (description "Jurusan ini mempelajari tentang penyakit dan cara mengobatinya."))
    ))

(defrule 2-no-7
    (answer (id 2) (answer "no"))
    (question (id 7 ) (text ?text))
    => 
    (assert (ask (id 7) (text ?text)))	
    )

(defrule 7-yes
    (answer (id 7) (answer "yes"))
    => 
    (assert (solution (solution "bisnis")))	
    (assert (description (description "Jurusan ini mempelajari tentang bisnis dan cara mengelolanya."))
    ))

(defrule 7-no-8
    (answer (id 7) (answer "no"))
    (question (id 8 ) (text ?text))
    => 
    (assert (ask (id 8) (text ?text)))	
    )

(defrule 8-no
    (answer (id 8) (answer "no"))
    => 
    (assert (solution (solution "akuntan")))	
    (assert (description (description "Jurusan ini mempelajari tentang akuntansi dan cara mengelolanya.")))
    )

(defrule 8-yes-9
    (answer (id 8) (answer "yes"))
    (question (id 9) (text ?text))
    => 
    (assert (ask (id 9) (text ?text)))	
    )

(defrule 9-yes
    (answer (id 9) (answer "yes"))
    => 
    (assert (solution (solution "data analyst")))	
    (assert (description (description "Jurusan ini mempelajari tentang analisis data dan cara mengolahnya."))
    ))

(defrule 9-no
    (answer (id 9) (answer "no"))
    => 
    (assert (solution (solution "data statistika")))	
    (assert (description (description "Jurusan ini mempelajari tentang statistika dan cara mengolahnya."))
    ))

(defrule 1-no-10
    (answer (id 1) (answer "no"))
    (question (id 10 ) (text ?text))
    => 
    (assert (ask (id 10) (text ?text)))	
    )

(defrule 10-yes-11
    (answer (id 10) (answer "yes"))
    (question (id 11 ) (text ?text))
    => 
    (assert (ask (id 11) (text ?text)))	
    )

(defrule 11-yes
    (answer (id 11) (answer "yes"))
    => 
	(assert (solution (solution "hukum")))	
    (assert (description (description "Jurusan ini mempelajari tentang hukum dan cara mengelolanya."))
    ))

(defrule 11-no-12
    (answer (id 11) (answer "no"))
    (question (id 12 ) (text ?text))
    => 
    (assert (ask (id 12) (text ?text)))	
    )

(defrule 12-yes
    (answer (id 12) (answer "yes"))
    => 
	(assert (solution (solution "ilmu komunikasi"))
    (assert (description (description "Jurusan ini mempelajari tentang komunikasi dan cara mengelolanya.")))
    ))
    

(defrule 12-no-13
    (answer (id 12) (answer "no"))
    (question (id 13 ) (text ?text))
    => 
    (assert (ask (id 13) (text ?text)))	
    )

(defrule 13-yes
    (answer (id 13) (answer "yes"))
    => 
	(assert (solution (solution "ilmu sosiologi")))	
    (assert (description (description "Jurusan ini mempelajari tentang sosiologi dan cara mengelolanya.")))
    )

(defrule 13-no
    (answer (id 13) (answer "no"))
    => 
	(assert (solution (solution "ilmu psikologi")))	
    (assert (description (description "Jurusan ini mempelajari tentang psikologi dan cara mengelolanya.")))
    )

(defrule 10-no-14
    (answer (id 10) (answer "no"))
    (question (id 14 ) (text ?text))
    => 
    (assert (ask (id 14) (text ?text)))	
    )

(defrule 14-yes
    (answer (id 14) (answer "yes"))
    => 
	(assert (solution (solution "bahasa")))	
    (assert (description (description "Jurusan ini mempelajari tentang bahasa dan cara mengelolanya.")))
    )

(defrule 14-no-15
    (answer (id 14) (answer "no"))
    (question (id 15 ) (text ?text))
    => 
    (assert (ask (id 15) (text ?text)))	
    )

(defrule 15-yes
    (answer (id 15) (answer "yes"))
    => 
	(assert (solution (solution "budaya")))
    (assert (description (description "Jurusan ini mempelajari tentang budaya dan cara mengelolanya.")))
    )

(defrule 15-no
    (answer (id 15) (answer "no"))
    => 
	(assert (solution (solution "filosofi")))	
    (assert (description (description "Jurusan ini mempelajari tentang filosofi dan cara mengelolanya.")))
)

(defrule print-solution
    (solution (solution ?t))
    =>
    (printout t ?t crlf)
    )

(defquery get-solution
    (solution (solution ?solution))
    (description (description ?description))
    )

(reset)
(run)

; Create query to save the output

