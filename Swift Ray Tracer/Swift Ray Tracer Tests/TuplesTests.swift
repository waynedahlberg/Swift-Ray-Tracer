//
//  TuplesTests.swift
//  Swift Ray Tracer Tests
//
//  Created by Wayne Dahlberg on 2/27/21.
//

import XCTest
@testable import Swift_Ray_Tracer

class TuplesTests: XCTestCase {
    override func setUpWithError() throws {
        // setup code here
    }
    
    override func tearDownWithError() throws {
        // tear down code here
    }
    
    func test_Point_Tuple() throws {
        /*
        Scenario: A tuple with w=1.0 is a point
        Given a ← tuple(4.3, -4.2, 3.1, 1.0)
        Then a.x = 4.3
        And a.y = -4.2
        And a.z = 3.1
        And a.w = 1.0
        And a is a point
        And a is not a vector
        */
        
        let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 1.0)
        XCTAssertEqual(4.3, a.x)
        XCTAssertEqual(-4.2, a.y)
        XCTAssertEqual(3.1, a.z)
        XCTAssertEqual(1.0, a.w)
        XCTAssertTrue(a.type == .point)
        XCTAssertFalse(a.type == .vector)
    }
    
    func test_Vector_Tuple() throws {
        /*
        Scenario: A tuple with w=0 is a vector
        Given a ← tuple(4.3, -4.2, 3.1, 0.0)
        Then a.x = 4.3
        And a.y = -4.2
        And a.z = 3.1
        And a.w = 0.0
        And a is not a point And a is a vector
        */
        
        let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 0.0)
        XCTAssertEqual(4.3, a.x)
        XCTAssertEqual(-4.2, a.y)
        XCTAssertEqual(3.1, a.z)
        XCTAssertEqual(0.0, a.w)
        XCTAssertTrue(a.type == .vector)
        XCTAssertFalse(a.type == .point)
    }
    
    func test_initializePoint_FactoryMethod() throws {
        // Scenario: vector() creates tuples with w=0
        // Given v <- vector(4, -4, 3)
        // Then v = tuple(4, -4, 3, 0)
        let p = Point(4, -4, 3)
        let t = Tuple(4, -4, 3, 1.0)
        XCTAssertTrue(t.type == .point)
        XCTAssertEqual(t, p)
    }
    
    func test_initializeVector_FactoryMethod() throws {
        //    Scenario: vector() creates tuples with w=0
        //  Given v ← vector(4, -4, 3)
        //    Then v = tuple(4, -4, 3, 0)
        let p = Vector(4, -4, 3)
        let t = Tuple(4, -4, 3, 0.0)
        XCTAssertTrue(t.type == .vector)
        XCTAssertEqual(t, p)
    }
    
    /// Double comparision
    func test_CompareDouble() throws {
        let EPSILON: Double = 0.00001
        
        func equal(a: Double, b: Double) -> Bool {
            if abs(a-b) < EPSILON {
                return true
            }
            return false
        }
        
        let f1: Double = 33
        let f2: Double = 7
        let v1 = f1/f2
        let v2 = f1/f2
        
        XCTAssertTrue(equal(a: v1, b: v2))
    }
    
    /// Adding two tuples
    func test_addingTwoTuples() throws {
        // Scenario: Adding two tuples
        // Given a1 ← tuple(3, -2, 5, 1)
        // And a2 ← tuple(-2, 3, 1, 0)
        // Then a1 + a2 = tuple(1, 1, 6, 1)
        let a1 = Tuple(3, -2, 5, 1)
        let a2 = Tuple(-2, 3, 1, 0)
        let a3 = Tuple(1, 1, 6, 1)
        XCTAssertEqual(a3, a1 + a2)
    }
    
    /// Subtracting two tuples
    func test_subtractingPointFromPoint() throws {
        // Scenario: Subtracting two points
        // Given p1 ← point(3, 2, 1)
        // And p2 ← point(5, 6, 7)
        // Then p1 - p2 = vector(-2, -4, -6)
        let p1 = Point(3, 2, 1)
        let p2 = Point(5, 6, 7)
        let exp = Vector(-2, -4, -6)
        XCTAssertEqual(exp, p1 - p2)
    }
    
    /// Subtracting vectors from point
    func test_subtractingVectorsFromPoint() throws {
        // Scenario: Subtracting a vector from a point
        // Given p ← point(3, 2, 1)
        // And v ← vector(5, 6, 7)
        // Then p - v = point(-2, -4, -6)
        let p = Point(3, 2, 1)
        let v = Vector(5, 6, 7)
        let exp = Point(-2, -4, -6)
        XCTAssertEqual(exp, p - v)
    }
    
    /// Subtracting two vectors
    func test_subtractingTwoVectors() throws {
        //    Scenario: Subtracting two vectors
        //    Given v1 ← vector(3, 2, 1)
        //    And v2 ← vector(5, 6, 7)
        //    Then v1 - v2 = vector(-2, -4, -6)
        let v1 = Vector(3, 2, 1)
        let v2 = Vector(5, 6, 7)
        let exp = Vector(-2, -4, -6)
        XCTAssertEqual(exp, v1 - v2)
    }
    
    /// Subtracting a vector from a zero vector
    func test_subtractingVectorFromZeroVectorGivenZero() throws {
        //    Scenario: Subtracting a vector from the zero vector
        //    Given zero ← vector(0, 0, 0)
        //    And v ← vector(1, -2, 3)
        //    Then zero - v = vector(-1, 2, -3)
        let zero = Vector(x: 0, y: 0, z: 0)
        let v = Vector(x: 1, y: -2, z: 3)
        let exp = Vector(x: -1, y: 2, z: -3)
        XCTAssertEqual(exp, zero - v)
    }
    
    /// Negating a tuple
    func test_negatingTuple() throws {
        //    Scenario: Negating a tuple
        //    Given a ← tuple(1, -2, 3, -4)
        //    Then -a = tuple(-1, 2, -3, 4)
        let a = Tuple(1, -2, 3, -4)
        XCTAssertEqual(Tuple(-1, 2, -3, 4), -a)
    }
    
    /// Multiplying tuples
    func test_multiplyingTuples() throws {
        //    Scenario: Multiplying a tuple by a scalar
        //    Given a ← tuple(1, -2, 3, -4)
        //    Then a * 3.5 = tuple(3.5, -7, 10.5, -14)
        let a = Tuple(1, -2, 3, -4)
        XCTAssertEqual(Tuple(3.5, -7, 10.5, -14), a * 3.5)
        
        //    Scenario: Multiplying a tuple by a fraction
        //    Given a ← tuple(1, -2, 3, -4)
        //    Then a * 0.5 = tuple(0.5, -1, 1.5, -2)
        XCTAssertEqual(Tuple(x: 0.5, y: -1, z: 1.5, w: -2), a * 0.5)
    }
    
    /// Divide by scalar
    func test_divideByScalar() throws {
        //    Scenario: Dividing a tuple by a scalar
        //    Given a ← tuple(1, -2, 3, -4)
        //    Then a / 2 = tuple(0.5, -1, 1.5, -2)
        let a = Tuple(1, -2, 3, -4)
        XCTAssertEqual(Tuple(0.5, -1, 1.5, -2), a / 2)
    }
    
    /// Computing the magnitude of a vector
    func test_computingMagnitudeOfVector() throws {
        //    Scenario: Computing the magnitude of vector(1, 0, 0)
        //    Given v ← vector(1, 0, 0)
        //    Then magnitude(v) = 1
        var v = Vector(x: 1, y: 0, z: 0)
        XCTAssertEqual(1, v.magnitude)
        
        //    Scenario: Computing the magnitude of vector(0, 1, 0)
        //    Given v ← vector(0, 1, 0)
        //    Then magnitude(v) = 1
        v = Vector(x: 0, y: 1, z: 0)
        XCTAssertEqual(1, v.magnitude)
        
        //    Scenario: Computing the magnitude of vector(0, 0, 1)
        //    Given v ← vector(0, 0, 1)
        //    Then magnitude(v) = 1
        v = Vector(x: 0, y: 0, z: 1)
        XCTAssertEqual(1, v.magnitude)
        
        //    Scenario: Computing the magnitude of vector(1, 2, 3)
        //    Given v ← vector(1, 2, 3)
        //    Then magnitude(v) = √14
        v = Vector(x: 1, y: 2, z: 3)
        XCTAssertEqual(sqrt(14), v.magnitude)
        
        //    Scenario: Computing the magnitude of vector(-1, -2, -3)
        //    Given v ← vector(-1, -2, -3)
        //    Then magnitude(v) = √14
        v = Vector(x: -1, y: -2, z: -3)
        XCTAssertEqual(sqrt(14), v.magnitude)
    }
    
    /// Normalizing a vector
    func test_normalizing() throws {
        //    Scenario: Normalizing vector(4, 0, 0) gives (1, 0, 0)
        //    Given v ← vector(4, 0, 0)
        //    Then normalize(v) = vector(1, 0, 0)
        var v = Vector(4, 0, 0)
        var norm = v.normalizing()
        XCTAssertEqual(Vector(1, 0, 0), norm)
        
        //    Scenario: Normalizing vector(1, 2, 3)
        //    Given v ← vector(1, 2, 3)
        //    Then normalize(v) = approximately vector(0.26726, 0.53452, 0.80178)
        v = Vector(1, 2, 3)
        norm = v.normalizing()
        XCTAssertEqual(Vector(0.26727, 0.53452, 0.80178), norm)
        
        //    Scenario: The magnitude of a normalized vector
        // Given v ← vector(1, 2, 3)
        //    When norm ← normalize(v)
        //    Then magnitude(norm) = 1
        v = Vector(1, 2, 3)
        norm = v.normalizing()
        XCTAssertTrue(Double(1).isAlmostEqual(to: norm.magnitude))
        XCTAssertTrue(1 === norm.magnitude)
    }
    
    /// Dot product of two tuples
    func test_dotProductOfTwoTuples() throws {
        let a = Vector(1, 2, 3)
        let b = Vector(2, 3, 4)
        XCTAssertEqual(20, a.dot(b))
    }
    
    /// Cross product of two tuples
    func test_crossProductOfTwoTuples() throws {
        let a = Vector(1, 2, 3)
        let b = Vector(2, 3, 4)
        XCTAssertEqual(Vector(-1, 2, -1), a.cross(b))
        XCTAssertEqual(Vector(1, -2, 1), b.cross(a))
    }
    
    func _test_puttingItTogether() throws {
//        var p = projectile(Point(x: 0, y: 1, z: 0), Vector(x: 1, y: 1, z: 0).normalizing())
//        var e = environment(Vector(0, -0.1, 0), Vector(-0.01, 0, 0))
//        func tick(env: (Tuple, Tuple), proj: (Tuple, Tuple)) -> Tuple {
//
//        }
    }
}
