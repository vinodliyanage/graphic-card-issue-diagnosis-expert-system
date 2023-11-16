(defrule start
  =>
  (printout t "Graphic Card Issue? (yes/no) ")
  (assert (problem (read))))

(defrule rule1
  (problem yes)
  =>
  (printout t "The graphics card isn't detected? (yes/no) ")
  (assert (notDetected (read))))

(defrule rule2
  (problem yes)
  (notDetected yes)
  =>
  (printout t "Graphics card has physical damages? (yes/no) ")
  (assert (physicalDamage (read))))

(defrule rule3
  (problem yes)
  (notDetected yes)
  (physicalDamage yes)
  =>
  (printout t "Solution: Graphic card hardware issue." crlf))

(defrule rule4
  (problem yes)
  (notDetected yes)
  (physicalDamage no)
  =>
  (printout t "Solution: Connection issue." crlf))

(defrule rule5
  (problem yes)
  (notDetected no)
  =>
  (printout t "Driver warning? (yes/no) ")
  (assert (driverWarning (read))))

(defrule rule6
  (problem yes)
  (notDetected no)
  (driverWarning yes)
  =>
  (printout t "Solution: Driver conflicts." crlf))

(defrule rule7
  (problem yes)
  (notDetected no)
  (driverWarning no)
  =>
  (printout t "Solution: Outdated BIOS drivers." crlf))

(defrule rule8
  (problem no)
  =>
  (printout t "No display at all? (yes/no) ")
  (assert (noDisplay (read))))

(defrule rule9
  (problem no)
  (noDisplay yes)
  =>
  (printout t "Power issue? (yes/no) ")
  (assert (powerIssue (read))))

(defrule rule10
  (problem no)
  (noDisplay yes)
  (powerIssue yes)
  =>
  (printout t "Solution: Motherboard issue." crlf))

(defrule rule11
  (problem no)
  (noDisplay yes)
  (powerIssue no)
  =>
  (printout t "Solution: Display issue." crlf))

(defrule rule12
  (problem no)
  (noDisplay no)
  =>
  (printout t "Artifacts or distortion? (yes/no) ")
  (assert (artifacts (read))))

(defrule rule13
  (problem no)
  (noDisplay no)
  (artifacts yes)
  =>
  (printout t "Flickering screen? (yes/no) ")
  (assert (flickering (read))))

(defrule rule14
  (problem no)
  (noDisplay no)
  (artifacts yes)
  (flickering yes)
  =>
  (printout t "Solution: Loose connections." crlf))

(defrule rule15
  (problem no)
  (noDisplay no)
  (artifacts yes)
  (flickering no)
  =>
  (printout t "Solution: Damage connections." crlf))

(defrule rule16
  (problem no)
  (noDisplay no)
  (artifacts no)
  =>
  (printout t "Performance issues? (yes/no) ")
  (assert (performanceIssues (read))))

(defrule rule17
  (problem no)
  (noDisplay no)
  (artifacts no)
  (performanceIssues yes)
  =>
  (printout t "Solution: Update graphics drivers." crlf))

(defrule rule18
  (problem no)
  (noDisplay no)
  (artifacts no)
  (performanceIssues no)
  =>
  (printout t "The graphics card is functioning correctly." crlf))

(deffacts startup
  (start))
