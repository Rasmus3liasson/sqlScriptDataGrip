# sqlScriptDataGrip

**Book Store**

I de följande uppgifterna ska vi skriva SQL kod för att skapa en egen databas, egna tabeller och användare som får komma åt databasen. Om databasen redan existerar så ska den tas bort och skapas på nytt.

**Skapa en databas som heter bookstore med följande tabeller:**

**Tabell: “author”**
I tabellen författare vill vi ha en ”Identitetskolumn” (identity) kallad id som PK. Därutöver vill vi ha hakolumnerna: first_name, last_name och birth_date i passande datatyper.

**Tabell: ”book”**
I tabellen böcker vill vi ha isbn (ISBN13) som primärnyckel med lämpliga constraints. Utöver det vill vi ha kolumnerna: title, language, price, och publication_date av passande datatyper.
Sist vill vi ha en FK-kolumn ”author_id” som pekar mot tabellen ”author”. Kolumnen language får gärna brytas ut till en egen tabell för att inte lagra samma språk om och om igen utan istället lagra en fk till language tabellen.

**Tabell: ”bookstore”**
Utöver ett identity-id så behöver tabellen kolumner för att lagra butiksnamn samt stad.

**Tabell: ”inventory”**
I denna tabell vill vi ha 3 kolumner: store_id som kopplas mot Butiker, isbn som kopplas mot böcker, samt amount som säger hur många exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel på kolumnerna store_id och ISBN.
Lägg in ett par författare, böcker, butiker och lagersaldon för böcker som finns i de olika butikerna.

**Vy: “total_author_book_value”**
Skapa sedan en en vy som sammanställer data från tabellerna.
Vyn ska innehålla följande 4 kolumner (med en rad per författare): 
- ”name” – Hela namnet på författaren. 
- ”age” – Hur gammal författaren är. 
- ”book_title_count” – Hur många olika titlar vi har i ”Böcker” av den angivna författaren.
- ”inventory_value” – Totala värdet (pris) för författarens böcker i samtliga butiker.

Exempel: 
```sql
SELECT * FROM total_author_book_value LIMIT 1
```
| name      | age | book_title_count | inventory_value |
| ----------- | ----------- | ----------- | ----------- | 
| Eddie Neuman      | 23år       | 3st | 4182kr |

**Användare och Behörigheter:**
För att accessa databasen vill vi ha två konton med rätt behörigheter.

- **Utvecklarkonto:** 
  - Rättigheter att på bokdatabasen:
    - Lägga till (INSERT)
    - Ta bort (DELETE)
    - Uppdatera (UPDATE) tabeller samt deras innehåll.

- **Web Server-konto:**
  - Endast rättigheter att utföra CRUD-operationer (Create, Read, Update, Delete) och inte skapa eller ta bort databaser.

Inget av kontona ska få lägga till nya användare eller skapa nya databaser.
