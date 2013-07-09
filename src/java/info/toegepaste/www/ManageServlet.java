/*
    This file is part of javaProject2TI.

    javaProject2TI is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    javaProject2TI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with javaProject2TI.  If not, see <http://www.gnu.org/licenses/>.
*/
package info.toegepaste.www;

import info.toegepaste.www.entity.*;
import info.toepaste.www.enumeration.Soort;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author robin
 */
@WebServlet(name = "ManageServlet", urlPatterns = {"/ManageServlet"})
public class ManageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        EntityManagerFactory emf = null;
        HttpSession session = request.getSession();
        try {

            RequestDispatcher rd = null;
            emf = Persistence.createEntityManagerFactory("2TI3_Cominotto_Robin_project2013PU");
            EntityManager em = emf.createEntityManager();


            if (session.getAttribute("soorten") == null) {

                Query q = em.createNamedQuery("Docenten.alle");
                List<Docent> docenten = q.getResultList();
                session.setAttribute("docenten", docenten);
                q = em.createNamedQuery("Vakken.alle");
                List<Vak> vakken = q.getResultList();
                session.setAttribute("vakken", vakken);
                q = em.createNamedQuery("ComputerLokalen.alle");
                List<ComputerLokaal> computerLokalen = q.getResultList();
                session.setAttribute("computerLokalen", computerLokalen);
                q = em.createNamedQuery("GewoonLokalen.alle");
                List<Lokaal> lokalen = q.getResultList();
                session.setAttribute("gewoonLokalen", lokalen);

                Soort[] soorten = Soort.values();


                session.setAttribute("soorten", soorten);


            }

            if (!(request.getParameter("home") == null)) {
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("examen") == null)) {

                Query q = em.createNamedQuery("Examen.alle");
                List<Examen> examens = q.getResultList();

                em.close();
                request.setAttribute("examens", examens);

                rd = request.getRequestDispatcher("overzichtExamens.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("datum") == null)) {

                String datum = request.getParameter("datum");
                String[] datumArray = datum.split("/");
                datum = datumArray[2] + "-" + datumArray[1] + "-" + datumArray[0];
                Query q = em.createNamedQuery("Examen.zoekenOpDatum");
                q.setParameter("datum", datum);
                List<Examen> examens = q.getResultList();
                em.close();
                request.setAttribute("examens", examens);
                String titel = " op datum: " + datumArray[0] + "/" + datumArray[1] + "/" + datumArray[2];
                request.setAttribute("titel", titel);
                rd = request.getRequestDispatcher("overzichtExamens.jsp");
                rd.forward(request, response);

            } else if (!(request.getParameter("docent") == null)) {
                String docentId = request.getParameter("docent");

                Query q = em.createNamedQuery("Examen.zoekenOpDocent");
                q.setParameter("docentId", docentId);
                List<Examen> examens = q.getResultList();

                request.setAttribute("examens", examens);
                Docent docent = em.find(Docent.class, Long.parseLong(docentId));
                String titel = " op docent: " + docent.getVoornaam() + " " + docent.getFamilienaam();
                request.setAttribute("titel", titel);
                em.close();
                rd = request.getRequestDispatcher("overzichtExamens.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("vak") == null)) {
                String vakId = request.getParameter("vak");

                Query q = em.createNamedQuery("Examen.zoekenOpVak");
                q.setParameter("vakId", vakId);
                List<Examen> examens = q.getResultList();

                request.setAttribute("examens", examens);
                Vak vak = em.find(Vak.class, Long.parseLong(vakId));
                String titel = " op vak: " + vak.getNaam();
                request.setAttribute("titel", titel);
                em.close();
                rd = request.getRequestDispatcher("overzichtExamens.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("lokaal") == null)) {
                String lokaalId = request.getParameter("lokaal");

                Query q = em.createNamedQuery("Examen.zoekenOpLokaal");
                q.setParameter("lokaalId", lokaalId);
                List<Examen> examens = q.getResultList();

                request.setAttribute("examens", examens);
                Lokaal lokaal = em.find(Lokaal.class, Long.parseLong(lokaalId));
                String titel = " op lokaal: " + lokaal.getNummer();
                request.setAttribute("titel", titel);
                em.close();
                rd = request.getRequestDispatcher("overzichtExamens.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("soort") == null)) {
                String soort = request.getParameter("soort");

                Query q = em.createNamedQuery("Examen.zoekenOpSoort");
                q.setParameter("soort", soort);
                List<Examen> examens = q.getResultList();


                String titel = " op soort: " + soort;
                request.setAttribute("titel", titel);
                request.setAttribute("examens", examens);
                em.close();
                rd = request.getRequestDispatcher("overzichtExamens.jsp");
                rd.forward(request, response);
            } else if (session.getAttribute("ingelogd") != null) {
                if (!(request.getParameter("toevoegenExamen") == null)) {
                    Examen examen = new Examen();
                    Query q = em.createNamedQuery("Lokaal.alle");
                    List<Lokaal> lokalen = q.getResultList();

                    request.setAttribute("lokalen", lokalen);
                    request.setAttribute("examen", examen);
                    em.close();
                    rd = request.getRequestDispatcher("toevoegenExamen.jsp");
                    rd.forward(request, response);
                } else if (!(request.getParameter("wijzigenExamen") == null)) {
                    String examenId = request.getParameter("wijzigenExamen");
                    Examen examen = em.find(Examen.class, Long.parseLong(examenId));

                    Query q = em.createNamedQuery("Lokaal.alle");
                    List<Lokaal> lokalen = q.getResultList();
                    em.close();
                    request.setAttribute("lokalen", lokalen);
                    request.setAttribute("examen", examen);
                    rd = request.getRequestDispatcher("toevoegenExamen.jsp");
                    rd.forward(request, response);
                } else if (!(request.getParameter("toevoegenExamenBevestigen") == null)) {
                    String docentId = request.getParameter("docentExamen");
                    String vakId = request.getParameter("vakExamen");
                    String datum = request.getParameter("datumExamen");
                    String lokaalId = request.getParameter("lokaalExamen");
                    String soort = request.getParameter("soortExamen");
                    String examenId = request.getParameter("examenId");
                    Docent docent = em.find(Docent.class, Long.parseLong(docentId));
                    Vak vak = em.find(Vak.class, Long.parseLong(vakId));
                    Lokaal lokaal = em.find(Lokaal.class, Long.parseLong(lokaalId));




                    Examen examen = new Examen();
                    if (!examenId.isEmpty() && !(examenId == null)) {
                        examen.setId(Long.parseLong(examenId));
                    }

                    examen.setDocent(docent);
                    examen.setVak(vak);
                    examen.setLokaal(lokaal);
                    examen.setSoort(Soort.valueOf(soort));

                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    GregorianCalendar gregorianCalendar = new GregorianCalendar();
                    gregorianCalendar.setTime(simpleDateFormat.parse(datum));

                    examen.setDatum(gregorianCalendar);

                    EntityTransaction tx = em.getTransaction();

                    tx.begin();
                    if (!examenId.isEmpty() && !(examenId == null)) {
                        em.merge(examen);
                    } else {
                        em.persist(examen);
                    }
                    tx.commit();

                    em.close();
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                } else if (!(request.getParameter("deleteExamen") == null)) {
                    String examenId = request.getParameter("deleteExamen");
                    Examen examen = em.find(Examen.class, Long.parseLong(examenId));


                    EntityTransaction tx = em.getTransaction();

                    tx.begin();
                    em.remove(examen);
                    tx.commit();
                    Query q = em.createNamedQuery("Docenten.alle");
                    List<Docent> docenten = q.getResultList();

                    session.setAttribute("docenten", docenten);
                    q = em.createNamedQuery("Examen.alle");
                    List<Examen> examens = q.getResultList();

                    session.setAttribute("examens", examens);
                    em.close();

                    rd = request.getRequestDispatcher("overzichtExamens.jsp");
                    rd.forward(request, response);
                }
            } else {
                response.sendRedirect("index.jsp");
            }


            //let op: gebruik hier de juiste naam van de persistence unit
            //(zoek op in persistence.xml)

            /*
             emf = Persistence.createEntityManagerFactory("2TI3_Cominotto_Robin_project2013PU");

             EntityManager em = emf.createEntityManager();



             EntityTransaction tx = em.getTransaction();
             Docent docentEen = new Docent();
             Docent docentTwee = new Docent();

             Examen examenEen = new Examen();
             Examen examenTwee = new Examen();
             Examen examenDrie = new Examen();

             ComputerLokaal computerLokaal = new ComputerLokaal();
             GewoonLokaal gewoonLokaal = new GewoonLokaal();
             Vak vakEen = new Vak();
             Vak vakTwee = new Vak();
             Vak vakDrie = new Vak();
             tx.begin();

             computerLokaal.setAantalPlaatsen(100);
             computerLokaal.setNummer("D101");
             computerLokaal.setLaptop(false);
             computerLokaal.setInfo("Niet roken!");
             em.persist(computerLokaal);


             vakEen.setNummer("s5454");
             vakEen.setNaam("C#");
             em.persist(vakEen);


             docentEen.setNummer("r00001");
             docentEen.setVoornaam("Miranda");
             docentEen.setFamilienaam("Decabooter");
             docentEen.setEmail("Miranda.Decabooter@khk.be");
             em.persist(docentEen);



             examenEen.setVak(vakEen);
             examenEen.setDocent(docentEen);
             examenEen.setDatum(new GregorianCalendar());
             examenEen.setLokaal(computerLokaal);
             examenEen.setSoort(Soort.SCHRIFTELIJK);
             em.persist(examenEen);




             //Insert 2
             gewoonLokaal.setAantalPlaatsen(50);
             gewoonLokaal.setNummer("Noord-Korea");
             gewoonLokaal.setWhiteBoard(true);
             em.persist(gewoonLokaal);

             vakTwee.setNummer("s5455");
             vakTwee.setNaam("Dynamische webapplicaties in PHP");
             em.persist(vakTwee);



             examenTwee.setVak(vakTwee);
             examenTwee.setDocent(docentEen);
             examenTwee.setDatum(new GregorianCalendar());
             examenTwee.setLokaal(gewoonLokaal);
             examenTwee.setSoort(Soort.SCHRIFTELIJK);
             em.persist(examenTwee);

             //Insert 3


             vakDrie.setNummer("s5456");
             vakDrie.setNaam("UML");
             em.persist(vakDrie);

             docentTwee.setNummer("r00002");
             docentTwee.setVoornaam("Christine");
             docentTwee.setFamilienaam("Smeets");
             docentTwee.setEmail("Christine.Smeets@khk.be");
             em.persist(docentTwee);

             examenDrie.setVak(vakDrie);
             examenDrie.setDocent(docentTwee);
             examenDrie.setDatum(new GregorianCalendar());
             examenDrie.setLokaal(gewoonLokaal);
             examenDrie.setSoort(Soort.SCHRIFTELIJK);
             em.persist(examenDrie);
             tx.commit();

             em.close();




             */

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            emf.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
