package photographer.nav;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PhotographerManager {

    private static final String DIRECTORY_PATH = "C:\\Users\\nwick\\OneDrive\\Desktop\\photpgraphers.txt";
    private static final String FILE_PATH = "C:\\Users\\nwick\\OneDrive\\Desktop\\data.txt";


    public void addPhotographer(Photographer photographer) throws IOException {
        ensureDirectoryExists();
        try (PrintWriter out = new PrintWriter(new FileWriter(FILE_PATH, true))) {
            out.println(photographer.toString());
        }
    }


    public List<Photographer> getAllPhotographers() throws IOException {
        ensureDirectoryExists();
        List<Photographer> photographers = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return photographers;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 8) {
                    Photographer p = new Photographer(
                            Integer.parseInt(parts[0]),
                            parts[1],
                            parts[2],
                            parts[3],
                            parts[4],
                            Double.parseDouble(parts[5]),
                            Double.parseDouble(parts[6]),
                            parts[7]
                    );
                    photographers.add(p);
                }
            }
        }
        return photographers;
    }


    public Photographer getPhotographerById(int id) throws IOException {
        List<Photographer> photographers = getAllPhotographers();
        for (Photographer p : photographers) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }


    public void updatePhotographer(Photographer updatedPhotographer) throws IOException {
        List<Photographer> photographers = getAllPhotographers();
        for (int i = 0; i < photographers.size(); i++) {
            if (photographers.get(i).getId() == updatedPhotographer.getId()) {
                photographers.set(i, updatedPhotographer);
                break;
            }
        }
        saveAllPhotographers(photographers);
    }


    public void deletePhotographer(int id) throws IOException {
        List<Photographer> photographers = getAllPhotographers();
        photographers.removeIf(p -> p.getId() == id);
        saveAllPhotographers(photographers);
    }


    public List<Photographer> sortPhotographersByRating() throws IOException {
        List<Photographer> photographers = getAllPhotographers();
        int n = photographers.size();

        for (int i = 0; i < n-1; i++) {
            for (int j = 0; j < n-i-1; j++) {
                if (photographers.get(j).getRating() < photographers.get(j+1).getRating()) {
                    Photographer temp = photographers.get(j);
                    photographers.set(j, photographers.get(j+1));
                    photographers.set(j+1, temp);
                }
            }
        }

        return photographers;
    }


    private void saveAllPhotographers(List<Photographer> photographers) throws IOException {
        ensureDirectoryExists();
        try (PrintWriter out = new PrintWriter(new FileWriter(FILE_PATH))) {
            for (Photographer p : photographers) {
                out.println(p.toString());
            }
        }
    }


    public int generateNewId() throws IOException {
        List<Photographer> photographers = getAllPhotographers();
        if (photographers.isEmpty()) {
            return 1;
        }
        return photographers.get(photographers.size() - 1).getId() + 1;
    }

    private void ensureDirectoryExists() {
        File directory = new File(DIRECTORY_PATH);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    }
}
