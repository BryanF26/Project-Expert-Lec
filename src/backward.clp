(set-strategy depth)

(deftemplate question
    (slot id)
    (slot text)
)

(deftemplate ask
    (slot id)
    (slot text)
)

(deftemplate solution
    (slot solution)
)

(deftemplate description
    (slot description)
)


(deftemplate answer
    (slot id)
    (slot answer)
)

(do-backward-chaining answer)

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

(deftemplate reason
    (slot id)
    (slot reason)
)

(defrule matematika-murni
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "yes"))
    (answer (id 3) (answer "yes"))
    (answer (id 4) (answer "yes"))
    =>
    (assert (solution (solution "Matematika Murni")))
    (assert (description (description "Jurusan ini mempelajari tentang matematika secara murni, tanpa adanya aplikasi pada bidang lain.")))
    
)

(defrule matematika-terapan-teknik
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "yes"))
    (answer (id 3) (answer "yes"))
    (answer (id 4) (answer "no"))
    =>
    (assert (solution (solution "Matematika Terapan / Teknik")))
    (assert (description (description "Jurusan ini mempelajari tentang matematika yang diterapkan pada bidang lain, seperti teknik, komputer, dan lain-lain.")))
)

(defrule kedokteran
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "yes"))
    (answer (id 3) (answer "no"))
    (answer (id 5) (answer "yes"))
    (answer (id 6) (answer "yes"))
    =>
    (assert (solution (solution "Kedokteran")))
    (assert (description (description "Kedokteran adalah ilmu yang mempelajari tentang penyakit, diagnosis, dan pengobatan.")))
)

(defrule farmasi
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "yes"))
    (answer (id 3) (answer "no"))
    (answer (id 5) (answer "yes"))
    (answer (id 6) (answer "no"))
    =>
    (assert (solution (solution "Farmasi")))
    (assert (description (description "Jurusan ini mempelajari tentang obat-obatan dan cara pembuatannya.")))
)

(defrule biologi
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "yes"))
    (answer (id 3) (answer "no"))
    (answer (id 5) (answer "no"))
    =>
    (assert (solution (solution "Biologi")))
    (assert (description (description "Jurusan ini mempelajari tentang kehidupan, baik itu hewan, tumbuhan, maupun manusia.")))
)

(defrule bisnis
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "no"))
    (answer (id 7) (answer "yes"))
    =>
    (assert (solution (solution "Bisnis")))
    (assert (description (description "Jurusan ini mempelajari tentang bisnis dan cara mengelolanya.")))
)

(defrule data-analyst
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "no"))
    (answer (id 7) (answer "no"))
    (answer (id 8) (answer "yes"))
    (answer (id 9) (answer "yes"))
    =>
    (assert (solution (solution "Data Analyst")))
    (assert (description (description "Jurusan ini mempelajari tentang analisis data dan cara mengolahnya.")))
)

(defrule statistika
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "no"))
    (answer (id 7) (answer "no"))
    (answer (id 8) (answer "yes"))
    (answer (id 9) (answer "no"))
    =>
    (assert (solution (solution "Statistika")))
    (assert (description (description "Jurusan ini mempelajari tentang statistika dan cara mengolahnya.")))
)

(defrule akuntan
    (answer (id 1) (answer "yes"))
    (answer (id 2) (answer "no"))
    (answer (id 7) (answer "no"))
    (answer (id 8) (answer "no"))
    =>
    (assert (solution (solution "Akuntan")))
    (assert (description (description "Jurusan ini mempelajari tentang akuntansi dan cara mengelolanya.")))
)

(defrule hukum
    (answer (id 1) (answer "no"))
    (answer (id 10) (answer "yes"))
    (answer (id 11) (answer "yes"))
    =>
    (assert (solution (solution "Hukum")))
    (assert (description (description "Jurusan ini mempelajari tentang hukum dan cara mengelolanya.")))
)

(defrule ilmu-komunikasi
    (answer (id 1) (answer "no"))
    (answer (id 10) (answer "yes"))
    (answer (id 11) (answer "no"))
    (answer (id 12) (answer "yes"))
    =>
    (assert (solution (solution "Ilmu Komunikasi")))
    (assert (description (description "Jurusan ini mempelajari tentang komunikasi dan cara mengelolanya.")))
)

(defrule sosiologi
    (answer (id 1) (answer "no"))
    (answer (id 10) (answer "yes"))
    (answer (id 11) (answer "no"))
    (answer (id 12) (answer "no"))
    (answer (id 13) (answer "yes"))
    =>
    (assert (solution (solution "Sosiologi")))
    (assert (description (description "Jurusan ini mempelajari tentang sosiologi dan cara mengelolanya.")))
)

(defrule psikologi
    (answer (id 1) (answer "no"))
    (answer (id 10) (answer "yes"))
    (answer (id 11) (answer "no"))
    (answer (id 12) (answer "no"))
    (answer (id 13) (answer "no"))
    =>
    (assert (solution (solution "Psikologi")))
    (assert (description (description "Jurusan ini mempelajari tentang psikologi dan cara mengelolanya.")))
)

(defrule bahasa
    (answer (id 1) (answer "no"))
    (answer (id 10) (answer "no"))
    (answer (id 14) (answer "yes"))
    =>
    (assert (solution (solution "Bahasa")))
    (assert (description (description "Jurusan ini mempelajari tentang bahasa dan cara mengelolanya.")))
)

(defrule budaya
    (answer (id 1) (answer "no"))
    (answer (id 10) (answer "no"))
    (answer (id 14) (answer "no"))
    (answer (id 15) (answer "yes"))
    =>
    (assert (solution (solution "Budaya")))
    (assert (description (description "Jurusan ini mempelajari tentang budaya dan cara mengelolanya.")))
)

(defrule filosofi
    (answer (id 1) (answer "no"))
    (answer (id 10) (answer "no"))
    (answer (id 14) (answer "no"))
    (answer (id 15) (answer "no"))
    =>
    (assert (solution (solution "Filosofi")))
    (assert (description (description "Jurusan ini mempelajari tentang filosofi dan cara mengelolanya.")))
)

(defrule need-to-ask
    "if there is a need to answer, ask it" 
    (need-answer (id ?id))
    (question (id ?id) (text ?text))
    =>
    (assert (ask (id ?id) (text ?text)))
)

(defrule ask-rule
    ?i <- (ask (id ?id) (text ?text))
    =>
    (bind ?answer "")
    (while (and (neq (str-compare ?answer "yes") 0) (neq (str-compare ?answer "no") 0)) do
        (printout t ?text " (yes/no) : ")
        (bind ?answer (readline))
    )
    (assert (answer (id ?id) (answer ?answer)))
    (retract ?i)
)

(defrule print-solution
    (solution (solution ?text))
    =>
    (printout t "Anda cocok untuk mengambil jurusan " ?text crlf)
)

(defrule matematika-murni-reason
    (solution (solution "Matematika Murni"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai menghitung.")))
    (assert (reason (id 2) (reason "Anda menyukai sains.")))
    (assert (reason (id 3) (reason "Anda menyukai matematika.")))
    (assert (reason (id 4) (reason "Anda berniat untuk menjadi peneliti di bidang matematika.")))
)

(defrule matematika-terapan-teknik-reason
    (solution (solution "Matematika Terapan / Teknik"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai menghitung.")))
    (assert (reason (id 2) (reason "Anda menyukai sains.")))
    (assert (reason (id 3) (reason "Anda menyukai matematika.")))
    (assert (reason (id 4) (reason "Anda tidak berniat untuk menjadi peneliti di bidang matematika.")))
)

(defrule kedokteran-reason
    (solution (solution "Kedokteran"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai menghitung")))
    (assert (reason (id 2) (reason "Anda menyukai sains.")))
    (assert (reason (id 3) (reason "Anda menyukai matematika")))
    (assert (reason (id 5) (reason "Anda menyukai dunia kesehatan.")))
    (assert (reason (id 6) (reason "Anda menyukai dunia kedokteran.")))
)

(defrule farmasi-reason
    (solution (solution "Farmasi"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai matematika.")))
    (assert (reason (id 2) (reason "Anda menyukai sains.")))
    (assert (reason (id 3) (reason "Anda tidak menyukai matematika")))
    (assert (reason (id 5) (reason "Anda menyukai dunia kesehatan.")))
    (assert (reason (id 6) (reason "Anda tidak menyukai dunia kedokteran.")))
)

(defrule biologi-reason
    (solution (solution "Biologi"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai menghitung.")))
    (assert (reason (id 2) (reason "Anda menyukai sains.")))
    (assert (reason (id 3) (reason "Anda tidak menyukai matematika")))
    (assert (reason (id 5) (reason "Anda tidak menyukai dunia kesehatan.")))
)

(defrule bisnis-reason
    (solution (solution "Bisnis"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai menghitung")))
    (assert (reason (id 2) (reason "Anda tidak menyukai sains.")))
    (assert (reason (id 7) (reason "Anda menyukai dunia bisnis.")))
)

(defrule data-analyst-reason
    (solution (solution "Data Analyst"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai mengghitung.")))
    (assert (reason (id 2) (reason "Anda tidak menyukai sains.")))
    (assert (reason (id 7) (reason "Anda tidak menyukai dunia bisnis.")))
    (assert (reason (id 8) (reason "Anda tertarik pada dunia analisis data dan statistika.")))
    (assert (reason (id 9) (reason "Anda tertarik pada teknologi dan komputer.")))
)

(defrule statistika-reason
    (solution (solution "Statistika"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai menghitung.")))
    (assert (reason (id 2) (reason "Anda tidak menyukai sains.")))
    (assert (reason (id 7) (reason "Anda tidak menyukai dunia bisnis.")))
    (assert (reason (id 8) (reason "Anda tertarik pada dunia analisis data dan statistika.")))
    (assert (reason (id 9) (reason "Anda tidak tertarik pada teknologi dan komputer.")))
)

(defrule akuntan-reason
    (solution (solution "Akuntan"))
    =>
    (assert (reason (id 1) (reason "Anda menyukai menghitung.")))
    (assert (reason (id 2) (reason "Anda tidak menyukai sains.")))
    (assert (reason (id 7) (reason "Anda tidak menyukai dunia bisnis.")))
    (assert (reason (id 8) (reason "Anda tidak tertarik pada dunia analisis data dan statistika.")))
)

(defrule hukum-reason
    (solution (solution "Hukum"))
    =>
    (assert (reason (id 1) (reason "Anda tidak menyukai menghitung.")))
    (assert (reason (id 10) (reason "Anda tertarik pada ilmu sosial.")))
    (assert (reason (id 11) (reason "Anda tertarik dengan dunia politik.")))
)

(defrule ilmu-komunikasi-reason
    (solution (solution "Ilmu Komunikasi"))
    =>
    (assert (reason (id 1) (reason "Anda tidak menyukai menghitung.")))
    (assert (reason (id 10) (reason "Anda tertarik pada ilmu sosial.")))
    (assert (reason (id 11) (reason "Anda tidak tertarik dengan dunia politik.")))
    (assert (reason (id 12) (reason "Anda tertarik dengan dunia komunikasi.")))
)

(defrule sosiologi-reason
    (solution (solution "Sosiologi"))
    =>
    (assert (reason (id 1) (reason "Anda tidak menyukai menghitung.")))
    (assert (reason (id 10) (reason "Anda tertarik pada ilmu sosial.")))
    (assert (reason (id 11) (reason "Anda tidak tertarik dengan dunia politik.")))
    (assert (reason (id 12) (reason "Anda tidak tertarik dengan dunia komunikasi.")))
    (assert (reason (id 13) (reason "Anda senang mengamati suatu kelompok.")))
)

(defrule psikologi-reason
    (solution (solution "Psikologi"))
    =>
    (assert (reason (id 1) (reason "Anda tidak menyukai menghitung.")))
    (assert (reason (id 10) (reason "Anda tertarik pada ilmu sosial.")))
    (assert (reason (id 11) (reason "Anda tidak tertarik dengan dunia politik.")))
    (assert (reason (id 12) (reason "Anda tidak tertarik dengan dunia komunikasi.")))
    (assert (reason (id 13) (reason "Anda tidak senang mengamati suatu kelompok.")))
)

(defrule bahasa-reason
    (solution (solution "Bahasa"))
    =>
    (assert (reason (id 1) (reason "Anda tidak menyukai menghitung.")))
    (assert (reason (id 10) (reason "Anda tidak tertarik pada ilmu sosial.")))
    (assert (reason (id 14) (reason "Anda menyukai ilmu bahasa.")))
)

(defrule budaya-reason
    (solution (solution "Budaya"))
    =>
    (assert (reason (id 1) (reason "Anda tidak menyukai menghitung.")))
    (assert (reason (id 10) (reason "Anda tidak tertarik pada ilmu sosial.")))
    (assert (reason (id 14) (reason "Anda tidak menyukai ilmu bahasa.")))
    (assert (reason (id 15) (reason "Anda menyukai ilmu kebudayaan.")))
)

(defrule filosofi-reason
    (solution (solution "Filosofi"))
    =>
    (assert (reason (id 1) (reason "Anda tidak menyukai menghitung.")))
    (assert (reason (id 10) (reason "Anda tidak tertarik pada ilmu sosial.")))
    (assert (reason (id 14) (reason "Anda tidak menyukai ilmu bahasa.")))
    (assert (reason (id 15) (reason "Anda tidak menyukai ilmu kebudayaan.")))
    (assert (reason (id 16) (reason "Anda menyukai ilmu filosofi.")))
)

(defquery get-solution
    (solution (solution ?solution))
    (description (description ?description))
    (reason (id ?id) (reason ?reason))
)


(reset)
(run)