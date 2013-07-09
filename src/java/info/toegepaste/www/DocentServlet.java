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
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DocentServlet", urlPatterns = {"/DocentServlet"})
public class DocentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        EntityManagerFactory emf = null;
        HttpSession session = request.getSession();
        try {

            RequestDispatcher rd = null;
            emf = Persistence.createEntityManagerFactory("2TI3_Cominotto_Robin_project2013PU");
            EntityManager em = emf.createEntityManager();
            if (!(request.getParameter("docentToevoegen") == null)) {
                rd = request.getRequestDispatcher("toevoegenDocent.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("docentToevoegenBevestigen") == null)) {
                String voornaam = request.getParameter("voornaamDocent");
                String familienaam = request.getParameter("familienaamDocent");
                String email = request.getParameter("emailDocent");
                String nummer = request.getParameter("nummerDocent");
                String docentId = request.getParameter("docentId");

                Docent docent = new Docent();
                docent.setVoornaam(voornaam);
                docent.setFamilienaam(familienaam);
                docent.setEmail(email);
                docent.setNummer(nummer);
                EntityTransaction tx = em.getTransaction();
                tx.begin();
                 if (!docentId.isEmpty() && !(docentId == null)) {
                    docent.setId(Long.parseLong(docentId));
                    em.merge(docent);
                }
                 else{
                     em.persist(docent);
                 }
              
                
               
                tx.commit();



                Query q = em.createNamedQuery("Docenten.alle");
                List<Docent> docenten = q.getResultList();
                session.setAttribute("docenten", docenten);
                em.close();

                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } 
           else if(session.getAttribute("ingelogd")!=null){
            if (!(request.getParameter("docenten") == null)) {


                Query q = em.createNamedQuery("Docenten.alle");
                List<Docent> docenten = q.getResultList();

                em.close();
                request.setAttribute("docenten", docenten);

                rd = request.getRequestDispatcher("overzichtDocenten.jsp");
                rd.forward(request, response);

            }
            else if (!(request.getParameter("wijzigenDocent") == null)) {


                String docentId = request.getParameter("wijzigenDocent");
                Docent docent = em.find(Docent.class, Long.parseLong(docentId));



                em.close();

                request.setAttribute("docent", docent);
                rd = request.getRequestDispatcher("toevoegenDocent.jsp");
                rd.forward(request, response);
            }
            else if (!(request.getParameter("deleteDocent") == null)) {
                String docentId = request.getParameter("deleteDocent");
                Docent docent = em.find(Docent.class, Long.parseLong(docentId));


                EntityTransaction tx = em.getTransaction();

                tx.begin();
                try {
                    em.remove(docent);
                    tx.commit();
                } catch (Exception e) {
                    Query q = em.createNamedQuery("Docenten.alle");
                    List<Docent> docenten = q.getResultList();
                    request.setAttribute("docenten", docenten);
                    em.close();
                    String boodschap = "Deze docent kan niet verwijderd worden!";
                    request.setAttribute("boodschap", boodschap);
                    rd = request.getRequestDispatcher("boodschap.jsp");
                    rd.forward(request, response);
                }

                Query q = em.createNamedQuery("Docenten.alle");
                List<Docent> docenten = q.getResultList();

                session.setAttribute("docenten", docenten);

                em.close();

                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
            }
           else{
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
